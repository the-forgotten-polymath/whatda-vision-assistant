# WATDA?! --- Technical Architecture

**Stack:** Swift 6, SwiftUI, Vision, Foundation Models, SwiftData, Swift
Concurrency\
**Deployment:** iOS 17.6+\
**Primary intelligence:** Foundation Models when available\
**Architecture:** Feature-oriented, protocol-based, availability-aware

------------------------------------------------------------------------

## 1. Architecture Goals

The architecture must:

1.  Keep SwiftUI independent of Foundation Models implementation
    details.
2.  Keep Vision independent of UI.
3.  Make AI behavior testable with fixtures.
4.  Handle Foundation Models availability at runtime.
5.  Avoid unnecessary main-thread work.
6.  Make model replacement possible in the future.
7.  Keep images local by default.
8.  Make cancellation and lifecycle explicit.
9.  Make OS/model-version regressions testable.

------------------------------------------------------------------------

## 2. High-Level Architecture

``` text
                         WATDAApp
                            |
                       SwiftUI Views
                            |
                    Feature ViewModels
                            |
                    Application Services
                            |
       +--------------------+---------------------+
       |                    |                     |
   CameraService      VisionAnalyzer        ExplainEngine
       |                    |                     |
   AVFoundation       Vision framework      +----+----+
                                            |         |
                                  FoundationModels  Compatibility
                                            |
                                   LanguageModelSession
                                            |
                                      Structured Output
                                            |
                                      ExplanationResult
                                            |
                                       SwiftData Store
```

------------------------------------------------------------------------

## 3. Module Boundaries

``` text
App/
Camera/
Vision/
Intelligence/
Models/
Persistence/
Features/
UI/
Utilities/
Tests/
```

### App

Composition root, dependency injection, lifecycle.

### Camera

Owns camera capture only.

### Vision

Owns image analysis only.

### Intelligence

Owns model interaction only.

### Models

Pure domain types.

### Persistence

Owns SwiftData and storage.

### Features

Owns user-facing workflows.

### UI

Reusable SwiftUI components and design system.

------------------------------------------------------------------------

## 4. Recommended Repository

``` text
WATDA/
├── WATDAApp.swift
├── App/
│   ├── AppEnvironment.swift
│   └── AppRouter.swift
│
├── Camera/
│   ├── CameraService.swift
│   ├── CameraSession.swift
│   ├── CameraViewModel.swift
│   ├── CameraPermission.swift
│   └── PreviewView.swift
│
├── Vision/
│   ├── VisionAnalyzer.swift
│   ├── TextAnalyzer.swift
│   ├── BarcodeAnalyzer.swift
│   ├── DocumentAnalyzer.swift
│   ├── SubjectAnalyzer.swift
│   └── ImageQualityAnalyzer.swift
│
├── Intelligence/
│   ├── ExplainEngine.swift
│   ├── ExplainSession.swift
│   ├── ExplainError.swift
│   ├── PromptLibrary.swift
│   ├── PromptVersion.swift
│   ├── Foundation/
│   │   ├── FoundationExplainEngine.swift
│   │   ├── FoundationExplainSession.swift
│   │   ├── GenerableTypes.swift
│   │   └── FoundationAvailability.swift
│   └── Compatibility/
│       └── UnsupportedExplainEngine.swift
│
├── Models/
│   ├── VisualContext.swift
│   ├── ExplanationResult.swift
│   ├── ConfidenceLevel.swift
│   ├── SubjectCategory.swift
│   └── ChatMessage.swift
│
├── Persistence/
│   ├── ModelContainerFactory.swift
│   ├── Scan.swift
│   ├── StoredMessage.swift
│   ├── ScanRepository.swift
│   └── ImageStore.swift
│
├── Features/
│   ├── Camera/
│   ├── Explanation/
│   ├── Conversation/
│   ├── History/
│   └── Settings/
│
├── UI/
│   ├── Components/
│   ├── Cards/
│   └── DesignSystem/
│
└── Tests/
```

------------------------------------------------------------------------

## 5. Domain Types

### ExplanationResult

``` swift
struct ExplanationResult: Sendable, Equatable {
    let subject: String
    let confidence: ConfidenceLevel
    let definition: String
    let simpleExplanation: String
    let analogy: String?
    let funFact: String?
    let observations: [VisualObservation]
    let followUpQuestions: [String]
    let category: SubjectCategory
}
```

### ConfidenceLevel

``` swift
enum ConfidenceLevel: String, Sendable, Codable {
    case high
    case medium
    case low
}
```

### SubjectCategory

``` swift
enum SubjectCategory: String, Sendable, Codable {
    case object
    case animal
    case plant
    case food
    case vehicle
    case technology
    case architecture
    case document
    case diagram
    case artwork
    case text
    case person
    case unknown
}
```

------------------------------------------------------------------------

## 6. VisualContext

``` swift
struct VisualContext: Sendable {
    let recognizedText: [RecognizedTextItem]
    let barcodes: [BarcodeItem]
    let document: DocumentContext?
    let observations: [VisualObservation]
    let imageQuality: ImageQuality
}
```

The model layer should not depend directly on `VNObservation` classes.
Convert Vision output into app-owned `Sendable` value types.

------------------------------------------------------------------------

## 7. Camera Protocol

``` swift
protocol CameraService: AnyObject, Sendable {
    func start() async throws
    func stop() async
    func capturePhoto() async throws -> CapturedImage
}
```

`CapturedImage` should contain the normalized image representation
needed downstream, plus metadata.

Do not expose `AVCaptureSession` to feature-level code.

------------------------------------------------------------------------

## 8. Vision Protocol

``` swift
protocol VisionAnalyzer: Sendable {
    func analyze(_ image: CapturedImage) async throws -> VisualContext
}
```

Implement specialized analyzers behind the protocol:

``` text
VisionAnalyzer
├── TextAnalyzer
├── BarcodeAnalyzer
├── DocumentAnalyzer
├── SubjectAnalyzer
└── ImageQualityAnalyzer
```

The orchestrator decides which analyses are useful.

------------------------------------------------------------------------

## 9. ExplainEngine Protocol

This is the critical abstraction.

``` swift
protocol ExplainEngine: Sendable {
    func startSession(
        image: CapturedImage,
        context: VisualContext
    ) async throws -> any ExplainSession
}
```

The session:

``` swift
protocol ExplainSession: Sendable {
    func initialExplanation() async throws -> ExplanationResult

    func ask(
        _ question: String
    ) async throws -> String

    func cancel() async
}
```

The exact async-stream API should be selected against the Foundation
Models SDK version used by the project. Keep streaming behind this
protocol so SwiftUI never depends on Foundation Models API details.

------------------------------------------------------------------------

## 10. Foundation Models Implementation

On a supported OS, the implementation uses:

``` swift
import FoundationModels
```

Availability must be checked before creating/using the model.

Conceptually:

``` swift
@available(iOS 26.0, *)
final actor FoundationExplainEngine: ExplainEngine {
    private let model = SystemLanguageModel.default

    func startSession(
        image: CapturedImage,
        context: VisualContext
    ) async throws -> any ExplainSession {
        guard model.availability == .available else {
            throw ExplainError.modelUnavailable
        }

        return FoundationExplainSession(
            image: image,
            context: context
        )
    }
}
```

Do not copy this blindly into the project. Compile against the exact SDK
version and adjust APIs to the installed Foundation Models SDK.

Apple's current documentation states that `SystemLanguageModel.default`
exposes availability and that availability depends on
device/region/Apple Intelligence state.

------------------------------------------------------------------------

## 11. Availability

Use runtime availability plus model availability.

Conceptually:

``` swift
if #available(iOS 26.0, *) {
    let model = SystemLanguageModel.default

    switch model.availability {
    case .available:
        // Full intelligence
    case .unavailable(.appleIntelligenceNotEnabled):
        // Ask user to enable Apple Intelligence
    case .unavailable(.deviceNotEligible):
        // Explain device limitation
    case .unavailable(.modelNotReady):
        // Model not ready
    }
}
```

The exact availability cases should be compiled against the current SDK.

Apple currently documents `appleIntelligenceNotEnabled`,
`deviceNotEligible`, and `modelNotReady`.

------------------------------------------------------------------------

## 12. LanguageModelSession

A visual scan should create one conversational model session.

Conceptually:

``` swift
@available(iOS 26.0, *)
actor FoundationExplainSession: ExplainSession {

    private let session: LanguageModelSession

    init(
        image: CapturedImage,
        context: VisualContext
    ) {
        self.session = LanguageModelSession(
            instructions: PromptLibrary.visualExplanationInstructions
        )
    }

    func initialExplanation() async throws -> ExplanationResult {
        // Construct multimodal prompt/context.
        // Request a Generable result.
        // Convert SDK output into ExplanationResult.
    }

    func ask(_ question: String) async throws -> String {
        // Reuse the same session.
    }
}
```

`LanguageModelSession` maintains context between requests.

------------------------------------------------------------------------

## 13. Structured Generation

Never parse model-generated JSON manually if guided generation can
provide the domain type.

Conceptually:

``` swift
@Generable
struct GeneratedExplanation {
    var subject: String
    var confidence: GeneratedConfidence
    var definition: String
    var simpleExplanation: String
    var analogy: String?
    var funFact: String?
    var observations: [GeneratedObservation]
    var followUpQuestions: [String]
    var category: GeneratedCategory
}
```

Then convert:

``` text
GeneratedExplanation
        ↓
ExplanationResult
```

This isolates the SDK's generated types from the rest of the app.

------------------------------------------------------------------------

## 14. Why the Conversion Layer Matters

Do not let:

``` swift
@Generable
struct GeneratedExplanation
```

become the application's core domain model.

Foundation Models is an external framework.

The app should own:

``` swift
ExplanationResult
```

This protects the architecture from future SDK changes.

------------------------------------------------------------------------

## 15. Vision Text Recognition

For modern Vision APIs, prefer the current request API available in the
deployment SDK.

For legacy compatibility where needed, `VNRecognizeTextRequest` remains
an established path.

Conceptually:

``` swift
let request = VNRecognizeTextRequest()
request.recognitionLevel = .accurate
request.usesLanguageCorrection = true
```

For modern SDK code, Apple's `RecognizeTextRequest` provides async
`perform(on:)` APIs.

Select the implementation based on the minimum OS and SDK you compile
against.

------------------------------------------------------------------------

## 16. OCR Strategy

For a still image:

-   Prefer accurate recognition.
-   Detect language automatically unless a user locale is explicitly
    preferred.
-   Apply language correction where useful.
-   Use `minimumTextHeightFraction` to avoid processing tiny irrelevant
    text.
-   Do not send every OCR fragment to the model; trim and rank context.

Example context budget:

``` text
Primary large text
↓
Important labels
↓
Short surrounding text
↓
Ignore tiny peripheral text
```

------------------------------------------------------------------------

## 17. Document Analysis

When the image appears document-like, use modern document recognition
where available.

Potential use cases:

-   textbook pages
-   receipts
-   labels
-   forms
-   menus
-   tables
-   lists

The resulting structured document context can be given to Foundation
Models as supporting evidence.

------------------------------------------------------------------------

## 18. Image Preprocessing

Pipeline:

``` text
Camera output
    ↓
Normalize orientation
    ↓
Check dimensions
    ↓
Create working image
    ↓
Vision
    ↓
Foundation Models
```

Do not repeatedly convert:

``` text
CVPixelBuffer → UIImage → Data → UIImage → CGImage
```

unless required.

Prefer a canonical representation and explicit conversions.

------------------------------------------------------------------------

## 19. State Machine

``` swift
enum ExplainState: Equatable {
    case ready
    case capturing
    case analyzing
    case generating
    case complete(ExplanationResult)
    case failed(ExplainErrorPresentation)
}
```

Do not maintain multiple overlapping booleans such as:

``` swift
isLoading
isAnalyzing
isGenerating
hasResult
hasError
```

A state machine makes invalid combinations impossible.

------------------------------------------------------------------------

## 20. Cancellation

Every scan should be cancellable.

If the user leaves the result:

``` text
View disappears
    ↓
cancel Task
    ↓
cancel Vision if possible
    ↓
cancel model generation
    ↓
release image buffers
```

Avoid retaining a model session after its scan is abandoned.

------------------------------------------------------------------------

## 21. Swift Concurrency

Use Swift Concurrency throughout:

-   `async/await`
-   `Task`
-   `TaskGroup` where parallel Vision operations help
-   actors for mutable service state
-   `Sendable` domain values

Do not use detached tasks casually.

Prefer structured concurrency.

------------------------------------------------------------------------

## 22. Parallel Vision

If independent analyses are useful:

``` swift
async let text = textAnalyzer.analyze(image)
async let barcode = barcodeAnalyzer.analyze(image)
async let quality = qualityAnalyzer.analyze(image)

let context = try await VisualContext(
    recognizedText: text,
    barcodes: barcode,
    imageQuality: quality
)
```

Only parallelize when it materially reduces latency and memory usage.

------------------------------------------------------------------------

## 23. SwiftData

Recommended persistence model:

``` swift
@Model
final class Scan {
    @Attribute(.unique)
    var id: UUID

    var createdAt: Date
    var subject: String
    var definition: String
    var simpleExplanation: String
    var analogy: String?
    var funFact: String?
    var categoryRawValue: String
    var confidenceRawValue: String
    var imagePath: String
}
```

Conversation messages can be a related model or separate table-like
entity.

------------------------------------------------------------------------

## 24. Image Storage

Do not store large image blobs directly in SwiftData unless there is a
clear reason.

Prefer:

``` text
Application Support/
    Scans/
        <UUID>.jpg
```

SwiftData stores the path/identifier.

When deleting a scan:

1.  Delete image file.
2.  Delete SwiftData record.
3.  Delete messages.

Use transactional/error-aware behavior so orphaned files are cleaned up.

------------------------------------------------------------------------

## 25. View Architecture

Example:

``` text
CameraView
    |
    └── CameraViewModel
          |
          ├── CameraService
          ├── VisionAnalyzer
          └── ExplainEngine
```

Explanation:

``` text
ExplanationView
    |
    └── ExplanationViewModel
          |
          └── ExplainSession
```

History:

``` text
HistoryView
    |
    └── HistoryViewModel
          |
          └── ScanRepository
```

------------------------------------------------------------------------

## 26. Dependency Injection

Create a composition root:

``` swift
struct AppEnvironment {
    let camera: any CameraService
    let vision: any VisionAnalyzer
    let explainEngine: any ExplainEngine
    let scans: any ScanRepository
}
```

Tests can inject fake implementations.

------------------------------------------------------------------------

## 27. Testing with Fakes

``` swift
struct FakeExplainEngine: ExplainEngine {
    let result: ExplanationResult

    func startSession(
        image: CapturedImage,
        context: VisualContext
    ) async throws -> any ExplainSession {
        FakeExplainSession(result: result)
    }
}
```

This allows UI tests without requiring Foundation Models hardware.

------------------------------------------------------------------------

## 28. Error Model

``` swift
enum ExplainError: Error, Sendable {
    case cameraUnavailable
    case permissionDenied
    case imageTooPoor
    case visionFailed
    case modelUnavailable
    case modelNotReady
    case appleIntelligenceDisabled
    case deviceNotEligible
    case generationFailed
    case contextLimit
    case cancelled
    case persistenceFailed
    case unknown
}
```

Map errors to product copy separately.

------------------------------------------------------------------------

## 29. Main Actor Rules

SwiftUI observable state:

``` swift
@MainActor
@Observable
final class CameraViewModel {
    ...
}
```

Heavy image/model work should remain outside the main actor unless the
SDK requires otherwise.

Do not block the main thread with:

-   image encoding
-   Vision processing
-   model generation
-   large file IO.

------------------------------------------------------------------------

## 30. Model Versioning

Foundation Models changes with OS updates. Treat model behavior as a
moving dependency.

Maintain:

``` swift
enum PromptVersion {
    static let visualExplanation = "visual-explanation.v1"
    static let followUp = "follow-up.v1"
    static let simplify = "simplify.v1"
}
```

Maintain a benchmark suite for each supported major model behavior.

Apple's Foundation Models update documentation notes that the on-device
model changes across OS releases and recommends testing prompts against
new model versions.

------------------------------------------------------------------------

## 31. Observability

Development-only metrics:

``` text
cameraReadyLatency
captureLatency
visionLatency
modelTimeToFirstOutput
modelTotalLatency
generationFailureRate
contextTokenCount
```

Never log raw user images or full model conversations by default.

------------------------------------------------------------------------

## 32. Performance Strategy

### Camera

Keep preview lightweight.

### Vision

Analyze only captured images in MVP.

### Foundation Models

Create/use one session per visual exploration.

### Persistence

Write asynchronously.

### Images

Downsample only when appropriate; preserve enough detail for visual
understanding.

### Memory

Release temporary images after analysis.

------------------------------------------------------------------------

## 33. Availability Architecture

The application should compile with the iOS 17.6 deployment target while
isolating newer APIs behind availability checks.

Structure:

``` text
ExplainEngine
├── FoundationExplainEngine
│     @available(iOS 26.0, *)
│
└── CompatibilityExplainEngine
```

The exact Foundation Models availability annotation must be taken from
the installed SDK.

------------------------------------------------------------------------

## 34. Future Provider Abstraction

Keep:

``` swift
protocol ExplainEngine
```

so future implementations could include:

``` text
FoundationModelsExplainEngine
PrivateCloudComputeExplainEngine
ServerExplainEngine
MockExplainEngine
```

Do not build the future implementations until a product requirement
exists.

------------------------------------------------------------------------

## 35. Architecture Invariants

These should be treated as hard rules:

1.  SwiftUI never imports Foundation Models directly.
2.  SwiftUI never imports Vision directly.
3.  Domain models do not contain Vision/Foundation Models classes.
4.  AI output is converted into app-owned domain types.
5.  Vision results are converted into `Sendable` value types.
6.  Raw camera frames are never persisted.
7.  Model sessions are cancellable.
8.  AI availability is checked at runtime.
9.  User-facing copy is not generated for system errors.
10. Production logging never contains raw image/user content by default.

------------------------------------------------------------------------

## 36. Apple Documentation References

-   Foundation Models:
    https://developer.apple.com/documentation/foundationmodels
-   SystemLanguageModel:
    https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel
-   LanguageModelSession:
    https://developer.apple.com/documentation/foundationmodels/languagemodelsession
-   Foundation Models updates:
    https://developer.apple.com/documentation/updates/foundationmodels
-   Tool calling:
    https://developer.apple.com/documentation/foundationmodels/expanding-generation-with-tool-calling
-   Vision: https://developer.apple.com/documentation/vision
-   Text recognition:
    https://developer.apple.com/documentation/vision/recognizing-text-in-images
-   Document recognition:
    https://developer.apple.com/documentation/vision/recognizedocumentsrequest
