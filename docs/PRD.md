Yes. I’d treat this as a **real product specification**, not just an app idea.

One important technical correction before the PRD: **you cannot have Apple Foundation Models as the actual AI engine on iOS 17.6 devices.** Apple’s current Foundation Models framework requires Apple Intelligence-capable devices, and the current framework is designed around the newer OS generation; Apple’s current documentation describes iOS 27-era Foundation Models, multimodal prompting, guided generation, tool calling, and Vision integration. ([Apple Developer][1])

So I recommend:

* **Deployment target:** iOS 17.6
* **Primary intelligence:** Apple Foundation Models on supported iOS 26/27+ devices
* **Vision:** available across the broader deployment range
* **iOS 17.6–25.x:** graceful compatibility mode rather than pretending Foundation Models exists there
* **iOS 26/27 + Apple Intelligence capable device:** full product experience
* **No forced cloud AI in v1**

That gives you a genuinely solid architecture instead of making an impossible promise.

Also, I would **not use “Whatzit,” “Huh,” or “Bloop”** as the name. There are already apps using those names, including Whatzit and Huh on the App Store, and Bloop is already being used by multiple iOS products. ([App Store][2])

# Product name

## **WATDA?!**

Pronounced:

> **“What-da?!”**

Tagline:

> **Point at it. WATDA?! explains it.**

It is intentionally a little stupid, memorable, and curious.

App Store display name:

> **WATDA?! — See. Ask. Understand.**

Alternative names worth keeping in reserve:

* **Bonk**
* **Wutty**
* **Whazzat**
* **Thingy**
* **Splain**
* **YapZap**
* **HuhBuddy**
* **Lookit**
* **Explain-o**
* **Wot?!**

I would currently pick **WATDA?!** because it communicates the user's instinctive reaction when they see something unfamiliar.

Before launch, do a proper trademark/App Store/domain clearance. This document treats **WATDA?! as the working name**, not a legally cleared trademark.

---

# WATDA?! — Complete Product Requirements Document

**Document version:** 1.0
**Status:** Build specification
**Platform:** iPhone
**UI:** SwiftUI
**Deployment target:** iOS 17.6
**Primary AI:** Apple Foundation Models
**Computer Vision:** Apple Vision / VisionKit
**Persistence:** SwiftData
**Architecture:** Native Swift / Swift Concurrency
**Primary language:** Swift
**Design philosophy:** Native Apple, minimal, playful, educational

---

# 1. Executive Summary

## Product

**WATDA?!** is an on-device visual explanation app.

A user points an iPhone camera at something they don't understand, captures it, and WATDA?! explains it at multiple levels:

### Level 1 — Accurate

> **What is it?**

A concise, technically accurate definition.

### Level 2 — Simple

> **Explain it simply**

A concrete, intuitive explanation using analogies where appropriate.

### Level 3 — Deep

> **Go deeper**

A progressively more technical explanation.

The user can then ask contextual follow-up questions about the captured image.

---

# 2. Product Vision

## Vision statement

> **Make the physical world understandable by pointing at it.**

The user shouldn't need to:

1. recognize what they're looking at,
2. formulate a search query,
3. find the correct terminology,
4. read multiple articles,
5. synthesize the information.

Instead:

> **Point → Understand.**

---

# 3. Core Product Thesis

Most visual AI products focus on:

> **"What is this?"**

WATDA?! focuses on:

> **"Help me understand this."**

That distinction is critical.

Identification is merely the first step.

The real product is **understanding**.

---

# 4. Target Users

## Persona A — Curious person

Age:

15–35

Behavior:

> "I've seen this thing a hundred times but never knew what it actually did."

Examples:

* engine components
* electrical sockets
* architecture
* tools
* plants
* machines
* everyday objects

Primary need:

**Fast understanding.**

---

## Persona B — Student

Age:

13–25

Examples:

* textbook diagrams
* biology specimens
* physics experiments
* circuit boards
* equations
* historical artifacts
* chemistry equipment

Primary need:

**Understand difficult concepts visually.**

---

## Persona C — Technical learner

Examples:

* developers
* engineers
* mechanics
* electronics hobbyists
* science enthusiasts

Primary need:

**Definition → intuition → technical depth.**

---

## Persona D — Traveler

Points camera at:

* monuments
* signs
* objects
* artwork
* architecture

Primary need:

**Contextual understanding.**

---

## Persona E — Parent

Parent points at something while a child asks:

> "Daddy, what is that?"

WATDA?! provides a simple explanation.

Primary need:

**Instant educational answers.**

---

# 5. Product Principles

## Principle 1 — Camera first

The camera is the primary interface.

Not a chat interface.

---

## Principle 2 — Definition before simplification

Every explanation begins with an accurate explanation.

Then it simplifies it.

---

## Principle 3 — Never talk down to the user

"Simple" doesn't mean childish.

Avoid:

> "It's like a little thingy that goes zoom zoom."

Prefer:

> "Think of it like a valve that controls how much air enters the engine."

---

## Principle 4 — Separate observation from inference

The system should distinguish:

> "I can see..."

from:

> "I think this is..."

---

## Principle 5 — Uncertainty is a feature

The model must not fabricate confidence.

---

## Principle 6 — On-device by default

The core experience should remain local wherever Apple provides the required capability.

Vision's OCR processing, for example, can run on-device, which aligns well with the privacy model. ([Apple Developer][3])

---

# 6. Primary User Journey

```text
OPEN APP
   ↓
CAMERA
   ↓
POINT
   ↓
CAPTURE
   ↓
ANALYZE
   ↓
IDENTIFY
   ↓
WHAT IS IT?
   ↓
EXPLAIN SIMPLY
   ↓
FOLLOW-UP
   ↓
GO DEEPER
```

---

# 7. Home Screen

The home screen is the camera.

No traditional dashboard.

No feed.

No login.

No onboarding carousel.

## UI

```text
┌───────────────────────────────┐
│ WATDA?!                  ◷    │
│                               │
│                               │
│                               │
│          CAMERA               │
│                               │
│                               │
│                               │
│                               │
│                               │
│       [ capture button ]      │
│                               │
│       Photos       History    │
└───────────────────────────────┘
```

---

# 8. Camera Requirements

## Functional requirements

The camera must:

* request camera permission
* display live preview
* support front/rear camera appropriately
* support torch
* support focus
* support exposure adjustment
* handle orientation
* handle interruptions
* handle camera unavailable state
* handle denied permissions
* handle background/foreground transitions
* release camera resources correctly

---

# 9. Capture Flow

When the user presses capture:

### Phase 1

Freeze captured image.

### Phase 2

Display:

> **Looking...**

### Phase 3

Vision performs optional preprocessing.

### Phase 4

Foundation Models analyzes the image.

### Phase 5

Structured result appears.

---

# 10. Analysis Pipeline

```text
              CAMERA
                 │
                 ▼
           Captured Image
                 │
                 ▼
        Image Quality Check
                 │
        ┌────────┴────────┐
        │                 │
        ▼                 ▼
      Vision         Foundation
        │              Models
        │                 │
        ├── OCR           │
        ├── Barcode       │
        ├── Subject      │
        ├── Document     │
        │                 │
        └────────┬────────┘
                 ▼
          Unified Context
                 │
                 ▼
       Structured Generation
                 │
                 ▼
             Result
```

Apple explicitly supports image analysis through multimodal Foundation Models prompts and Vision tools such as OCR and barcode reading. ([Apple Developer][4])

---

# 11. Vision Responsibilities

Vision should **not replace Foundation Models**.

Vision is the deterministic perception/tool layer.

Use Vision for:

### OCR

Read visible text.

### Barcode detection

Identify UPC/EAN/QR-type codes where appropriate.

### Document analysis

Receipts, pages, labels, diagrams.

### Subject detection / segmentation

Identify visually distinct subjects.

### Image quality

Detect:

* excessive blur
* poor framing
* low-light conditions

Vision provides object detection, text recognition, image segmentation, barcode detection, classification and related computer-vision capabilities. ([Apple Developer][5])

---

# 12. Foundation Models Responsibilities

Foundation Models handles:

### Understanding

> What is this?

### Explanation

> What does it do?

### Simplification

> Explain it simply.

### Analogy

> Give me a useful analogy.

### Reasoning

> Why does this happen?

### Conversation

> Follow-up questions.

### Structured output

The app should request typed output rather than arbitrary text.

Apple's guided-generation APIs are designed specifically to return structured Swift data instead of requiring fragile string parsing. ([Apple Developer][6])

---

# 13. The Core AI Response

Every first response should contain:

```text
subject
confidence
definition
simpleExplanation
analogy
keyDetails
funFact
followUpQuestions
```

Example:

## Carburetor

### What is it?

> A carburetor is a mechanical device that mixes air and fuel in the correct proportion before the mixture enters an internal-combustion engine.

### Explain it simply

> Think of a carburetor like a chef mixing ingredients. An engine needs air and fuel to make power, and the carburetor mixes them together in the right amount before the engine burns the mixture.

### Think of it like...

> A tiny kitchen that prepares the engine's fuel-and-air recipe.

### Want to know more?

* How does it work?
* Why does it need air?
* What's inside it?

---

# 14. Structured AI Model

Conceptually:

```swift
@Generable
struct VisualExplanation {
    var subject: String
    var confidence: ConfidenceLevel

    var definition: String
    var simpleExplanation: String

    var analogy: String?
    var funFact: String?

    var observations: [Observation]
    var followUpQuestions: [String]

    var category: SubjectCategory
}
```

This is preferable to asking the model for arbitrary Markdown. Apple's constrained/guided generation is specifically intended to prevent malformed structured output. ([Apple Developer][6])

---

# 15. Confidence Model

Use three user-facing states.

## High

```text
That's a carburetor.
```

## Medium

```text
I think that's a carburetor.
```

## Low

```text
I'm not completely sure.

It looks like a carburetor, but
the image doesn't show enough detail
to be certain.
```

Never expose raw:

```text
confidence = 0.734821
```

to users.

---

# 16. Observation vs Inference

Internally:

```swift
struct Observation {
    var text: String
    var source: ObservationSource
}
```

Example:

### Observed

> "The object has several cylindrical metal components."

### Inferred

> "These components appear consistent with part of an engine."

This distinction helps reduce hallucination.

---

# 17. Explanation Levels

We should implement four internal levels.

| Level        | Purpose                 |
| ------------ | ----------------------- |
| Definition   | Accurate identification |
| Simple       | ELI5/intuitive          |
| Intermediate | General understanding   |
| Deep         | Technical explanation   |

But only expose three UI actions:

```text
WHAT IS IT?

EXPLAIN SIMPLY

GO DEEPER
```

---

# 18. First Result UI

```text
┌─────────────────────────────┐
│                             │
│       CAPTURED IMAGE        │
│                             │
└─────────────────────────────┘

CARBURETOR

WHAT IS IT?

A mechanical device that mixes
air and fuel before combustion
in an internal-combustion engine.


EXPLAIN SIMPLY

Think of it like a chef mixing
ingredients...


┌─────────────┐ ┌─────────────┐
│    HOW?     │ │    WHY?     │
└─────────────┘ └─────────────┘

┌─────────────────────────────┐
│        GO DEEPER →          │
└─────────────────────────────┘
```

---

# 19. Follow-up Conversation

The captured image remains associated with the session.

User:

> Why does it need air?

Foundation Models receives:

```text
Conversation history
+
original image context
+
current question
```

Response:

> Fuel doesn't burn effectively by itself. It needs oxygen from the air to support combustion...

The conversation must **not start a new model session for every question** unless context management requires it.

Foundation Models provides `LanguageModelSession` for conversational model interaction. ([Apple Developer][1])

---

# 20. Session Architecture

```text
ScanSession
│
├── capturedImage
├── visionContext
├── explanation
├── conversation
└── modelSession
```

The model session should be scoped to a single visual exploration.

---

# 21. Session Lifecycle

```text
Camera
 ↓
Capture
 ↓
Create Session
 ↓
Vision preprocessing
 ↓
Initial model generation
 ↓
Display explanation
 ↓
User asks question
 ↓
Continue session
 ↓
User exits
 ↓
Persist scan
 ↓
Destroy session
```

---

# 22. Prompt Architecture

Do **not** create one giant prompt.

Separate:

## System instructions

Stable product behavior.

## Dynamic visual context

Image + Vision observations.

## User request

What the user currently wants.

---

# 23. System Instruction

Conceptually:

```text
You are WATDA?!, a visual explanation assistant.

Your job is to help a person understand what
they are looking at.

Always prioritize factual accuracy.

For the first response:

1. Identify the primary subject.
2. State what it is in technically accurate,
   concise language.
3. Explain it in simple language.
4. Use a concrete analogy when it improves
   understanding.
5. Never invent details that cannot be supported.
6. Clearly communicate uncertainty.
7. Avoid unnecessary jargon.
8. Explain jargon when it is necessary.
9. Ask useful follow-up questions.
10. Never claim to see details that aren't visible.

Simple explanations must remain factually
consistent with the technical definition.
```

---

# 24. Prompt Versioning

Never hard-code an unversioned prompt.

Use:

```swift
enum PromptVersion {
    static let visualExplanation = "visual-explanation.v1"
    static let followUp = "follow-up.v1"
    static let simplification = "simplification.v1"
}
```

Apple's current Foundation Models documentation explicitly recommends managing/versioning prompts because model behavior can change between OS/model versions. ([Apple Developer][1])

This is **very important for iOS 27**.

---

# 25. Model Version Problem

The Foundation Model can change with OS updates.

Apple explicitly notes that the on-device model changes with iOS 27 updates and recommends testing prompts against the new model. ([Apple Developer][4])

Therefore:

### Never assume:

> "The model always behaves exactly the same."

Instead maintain:

```text
Prompt v1
Test dataset v1
Expected behavior v1
```

and run regression testing whenever Apple updates the model.

---

# 26. Foundation Models Availability Architecture

This is one of the most important parts.

Your app's deployment target can remain:

```text
iOS 17.6
```

but Foundation Models must be isolated behind an availability-aware implementation.

Architecture:

```text
ExplainEngine
     │
     ├───────────────┐
     │               │
     ▼               ▼
FoundationModels   Compatibility
Implementation     Implementation
     │               │
iOS 26/27+        iOS 17.6+
     │
Apple Intelligence
```

Use availability checks such as:

```swift
if #available(iOS 26.0, *) {
    // Foundation Models implementation
} else {
    // Compatibility experience
}
```

The exact minimum availability should be taken from the SDK you compile against rather than hard-coded from this PRD.

---

# 27. Compatibility Strategy

I recommend three tiers.

## Tier A — Full

### iOS 26/27+

Supported Apple Intelligence device.

Features:

* camera
* Vision
* Foundation Models
* structured generation
* follow-up conversation
* tools
* streaming

---

## Tier B — Vision-only

### iOS 17.6+

Unsupported for Foundation Models.

Features:

* camera
* OCR
* barcode
* subject detection
* image analysis
* saved scans

But:

> "AI explanations require an Apple Intelligence-compatible device."

---

## Tier C — Future server fallback

Not part of v1.

Could eventually use:

```text
Foundation Models
       ↓
Private Cloud Compute
       ↓
approved server model
```

Apple's current Foundation Models architecture also supports Private Cloud Compute and other model providers through the `LanguageModel` abstraction. ([Apple Developer][1])

But I would **not introduce this complexity initially**.

---

# 28. Why this architecture matters

It means:

### iOS 17.6 isn't broken.

The app launches.

Camera works.

Vision works.

History works.

The user isn't confronted with a crash because the model framework isn't available.

And:

### Supported modern device

gets the complete magic.

That's what I mean by "solid."

---

# 29. Tool Calling

Tools should be introduced carefully.

Foundation Models supports tools whose code can be called by the model during generation. ([Apple Developer][7])

Initial tools:

### OCRTool

Purpose:

> Extract visible text.

---

### BarcodeReaderTool

Purpose:

> Decode a barcode.

---

### ImageQualityTool

Purpose:

> Determine whether the image is sufficiently usable.

---

### SubjectContextTool

Purpose:

> Provide Vision observations.

---

# 30. Don't create unnecessary tools

Bad:

```text
GoogleTool
WikipediaTool
SearchEverythingTool
InternetTool
...
```

for v1.

The whole point is that the app should feel **local and instant**.

---

# 31. Vision + Foundation Models Relationship

The mental model should be:

### Vision

> **What can I mechanically observe?**

### Foundation Models

> **What does it mean?**

Example:

Vision:

```text
Detected text:
"RTX 5090"
```

Foundation Models:

> That's a high-end graphics processing unit used primarily for demanding graphics and AI workloads.

This division is clean.

---

# 32. OCR Flow

If the image contains significant text:

```text
Camera
 ↓
Vision OCR
 ↓
Recognized text
 ↓
Foundation Models
 ↓
"Explain this"
```

For example, point at:

> "Photosynthesis"

Output:

### What is it?

> Photosynthesis is the process plants use to convert light energy into chemical energy...

### Simply

> Plants basically use sunlight like a little power source to make their own food.

---

# 33. Document Mode

If Vision determines the image is document-like:

Offer:

> **Explain this page**

instead of treating it as a generic object.

Future:

* receipts
* textbook pages
* diagrams
* handwritten notes
* menus
* signs

---

# 34. Tap-to-Explain

## V1.1 feature

User captures an image.

Detected subjects can become tappable.

```text
        ┌───────────────┐
        │               │
        │   ENGINE      │
        │       ○       │
        │               │
        │    ○          │
        └───────────────┘
```

User taps a region.

The app asks:

> What is this part?

This can leverage Vision's subject/region capabilities. VisionKit also provides image-subject interaction capabilities on modern OS versions. ([Apple Developer][8])

---

# 35. History

Every completed scan can optionally be saved.

Home:

```text
History
────────────

Today

Carburetor
10:32 AM

Mechanical keyboard
10:17 AM

Monstera plant
9:44 AM
```

---

# 36. SwiftData Model

Conceptually:

```swift
@Model
final class Scan {
    var id: UUID
    var createdAt: Date

    var subject: String
    var definition: String
    var simpleExplanation: String

    var analogy: String?
    var funFact: String?

    var category: String
    var confidence: String

    var imagePath: String
}
```

Conversation:

```swift
@Model
final class Message {
    var id: UUID
    var scanID: UUID

    var role: String
    var content: String
    var createdAt: Date
}
```

---

# 37. Storage Rules

Do not store every camera frame.

Only store:

* captured image if user saves scan
* explanation
* user conversation
* metadata

Temporary analysis frames should be deleted.

---

# 38. Privacy Architecture

Default principle:

> **The photo belongs to the user.**

No server upload in the core experience.

No account.

No mandatory cloud.

No unnecessary analytics.

No location requirement.

No contacts.

No microphone unless voice interaction is explicitly added later.

---

# 39. Camera Privacy

Info.plist:

```text
NSCameraUsageDescription
```

Copy:

> WATDA?! uses your camera to understand what you point at.

Avoid:

> "WATDA?! needs camera access."

Explain the purpose.

---

# 40. Photo Library

Only request photo access when the user explicitly chooses:

> **Choose from Photos**

Prefer limited photo-library access where applicable.

Do not ask for photo permission during first launch.

---

# 41. No Account

MVP:

**No sign-up.**

This is important.

The product's first interaction should be:

> Open → point → learn.

---

# 42. Error States

Every failure must have a designed state.

## Camera permission denied

> Camera access is off.

> Open Settings to let WATDA?! look at things.

---

## Model unavailable

> WATDA?! needs Apple Intelligence to explain images on this device.

---

## Image too dark

> I can't see this very well.

> Try moving closer or adding some light.

---

## Image blurry

> Oof. This one's blurry.

> Hold still and try again.

---

## Model failure

> I couldn't figure this one out.

Buttons:

`Try again`

`Take another photo`

---

## Timeout

Never:

> Error 500.

User-facing:

> Something went sideways.

`Try again`

---

# 43. Safety System

This is an educational application, not a professional decision-maker.

The model should not confidently provide:

### Medical diagnosis

If user points at a rash:

> "This could be several things, but an image alone isn't enough to diagnose it."

---

### Medication advice

Explain labels but don't prescribe.

---

### Dangerous machinery

Explain safely.

Do not give operational instructions that could cause injury.

---

### Weapons

Identify/explain at a high level but don't provide harmful instructions.

---

### Financial documents

Explain terminology but don't provide personalized financial decisions.

---

# 44. Special Medical UX

If the subject appears medical:

```text
For education only

This explanation isn't a diagnosis
or medical advice.
```

This shouldn't appear on every result—only when relevant.

---

# 45. Accessibility

Must support:

* Dynamic Type
* VoiceOver
* Reduce Motion
* Increase Contrast
* Larger accessibility text
* Voice Control
* sufficient tap targets
* semantic labels

Camera controls need explicit accessibility labels.

Example:

```swift
.accessibilityLabel("Explain what I'm looking at")
```

---

# 46. Localization

Architecture should be localization-ready from day one.

Don't embed user-facing strings throughout Swift code.

Use:

```text
Localizable.xcstrings
```

Initial:

* English

Future:

* Hindi
* Spanish
* French
* German
* Japanese
* Korean
* Portuguese
* Chinese

Foundation Models supports system-language-aware interactions, which gives us a path to multilingual explanations as the product expands. ([Apple Developer][1])

---

# 47. UI Design Language

## Core aesthetic

**Native iOS + playful intelligence.**

Avoid:

* generic AI gradients
* purple "AI" glow
* chatbot bubbles
* excessive glass
* dashboard-heavy layouts

Use:

* large typography
* system materials
* subtle depth
* camera-first UI
* strong spacing
* fluid transitions
* restrained color

---

# 48. Brand Personality

WATDA?! should feel:

* curious
* slightly mischievous
* intelligent
* friendly
* confident but not arrogant

Not:

* childish
* corporate
* robotic
* "AI bro"

---

# 49. Signature Microinteraction

After capture:

```text
Captured image
      ↓
tiny pulse
      ↓
"Looking..."
      ↓
subject appears
      ↓
definition streams
      ↓
simple explanation expands
```

The transition should feel like:

> **The phone is thinking about what you're looking at.**

---

# 50. Streaming UX

Do not show a blank loading screen.

Render:

```text
CARBURETOR

A mechanical device...
```

Then continue:

```text
A mechanical device that mixes
air and fuel...
```

Then:

```text
A mechanical device that mixes
air and fuel before the mixture
enters the engine...
```

Foundation Models supports streaming generation, which is appropriate for this progressive UI. ([Apple Developer][9])

---

# 51. Main Navigation

I recommend only two primary areas:

```text
Camera
History
```

Camera is the default.

Do not create:

* Home
* Explore
* Discover
* Profile
* AI
* Settings

as five tabs.

Settings belongs in the appropriate system-style menu.

---

# 52. Settings

Settings:

### Appearance

* System
* Light
* Dark

### Explanation style

* Balanced
* Simple
* Detailed

### Save scans

* On
* Off

### Haptics

* On
* Off

### Privacy

* Privacy policy
* Data controls

### About

* Version
* Credits
* Apple Foundation Models disclosure

---

# 53. Share

A result can become a native share card.

Example:

```text
┌────────────────────────────┐
│                            │
│       WHAT'S THIS?         │
│                            │
│       CARBURETOR           │
│                            │
│ A mechanical device that   │
│ mixes air and fuel...      │
│                            │
│ Think of it like a chef    │
│ preparing an engine's      │
│ recipe.                    │
│                            │
│        WATDA?!             │
└────────────────────────────┘
```

Use `ShareLink`.

No custom social network.

---

# 54. MVP Feature Set

## Must have

### Camera

* [x] live preview
* [x] capture
* [x] flash
* [x] focus
* [x] permission handling

### Vision

* [x] OCR
* [x] image quality
* [x] subject/context extraction

### Foundation Models

* [x] multimodal prompt
* [x] structured output
* [x] streaming
* [x] session
* [x] follow-up question

### UI

* [x] definition
* [x] simple explanation
* [x] analogy
* [x] follow-up chips
* [x] deeper explanation

### Persistence

* [x] history
* [x] saved scan

---

# 55. Explicitly NOT MVP

Do not build:

* authentication
* social network
* subscriptions
* cloud database
* custom backend
* web search
* voice assistant
* AR overlays
* location
* recommendation feed
* gamification
* streaks
* profiles
* public sharing community

Those are distractions.

---

# 56. V1.1

Add:

* gallery
* tap-to-explain
* better document mode
* share cards
* explanation style selection
* improved Vision context
* favorites

---

# 57. V1.5

Add:

### Teach mode

```text
Teach me this.
```

Then:

```text
STEP 1
What it is

STEP 2
How it works

STEP 3
Why it matters
```

---

# 58. V2

### Interactive visual tutor

User:

> "Show me what's important here."

App highlights:

```text
① Carburetor
② Air intake
③ Fuel line
```

Then:

> Tap one.

This could become the genuinely differentiated feature.

---

# 59. V2 — Quiz Mode

After teaching:

> Want a tiny quiz?

Question:

> What does the carburetor mix?

Buttons:

```text
Air + fuel
Oil + water
Fuel + coolant
```

Then:

> **Yep. Air + fuel.**

This turns the app from explanation tool into learning tool.

---

# 60. Technical Architecture

Recommended architecture:

```text
                    WATDA?!
                       │
                 SwiftUI App
                       │
              ┌────────┴────────┐
              │                 │
          Camera UI         History UI
              │                 │
              ▼                 ▼
        CameraManager        SwiftData
              │
              ▼
        ExplainEngine
              │
       ┌──────┴──────┐
       │             │
     Vision       Intelligence
       │             │
       │        ┌────┴─────┐
       │        │          │
       │    Foundation   Future
       │     Models      Provider
       │        │
       └────────┤
                ▼
          VisualContext
                │
                ▼
       ExplanationResult
                │
                ▼
           SwiftUI View
```

---

# 61. Suggested Project Structure

```text
WATDA/
│
├── App/
│   ├── WATDAApp.swift
│   └── AppEnvironment.swift
│
├── Camera/
│   ├── CameraView.swift
│   ├── CameraManager.swift
│   ├── CameraSession.swift
│   ├── CameraPermission.swift
│   └── CameraViewModel.swift
│
├── Intelligence/
│   ├── ExplainEngine.swift
│   ├── ExplainSession.swift
│   ├── Explanation.swift
│   ├── PromptLibrary.swift
│   ├── PromptVersion.swift
│   │
│   ├── FoundationModels/
│   │   ├── FoundationExplainEngine.swift
│   │   ├── FoundationSession.swift
│   │   └── Generables.swift
│   │
│   └── Compatibility/
│       └── UnsupportedIntelligenceEngine.swift
│
├── Vision/
│   ├── VisionAnalyzer.swift
│   ├── OCRAnalyzer.swift
│   ├── BarcodeAnalyzer.swift
│   ├── SubjectAnalyzer.swift
│   └── ImageQualityAnalyzer.swift
│
├── Models/
│   ├── Scan.swift
│   └── Message.swift
│
├── Persistence/
│   ├── ModelContainer.swift
│   └── ScanRepository.swift
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
    ├── IntelligenceTests/
    ├── VisionTests/
    ├── CameraTests/
    └── UITests/
```

---

# 62. Protocol-Based AI Architecture

This is important.

Don't let SwiftUI directly instantiate Foundation Models.

Define:

```swift
protocol ExplainEngine: Sendable {
    func explain(
        image: CGImage,
        context: VisualContext
    ) async throws -> ExplanationResult
}
```

Then:

```text
ExplainEngine
      │
      ├── FoundationModelsExplainEngine
      │
      └── UnsupportedExplainEngine
```

This makes the application testable.

---

# 63. Vision Context

Create:

```swift
struct VisualContext: Sendable {
    var recognizedText: [RecognizedText]
    var detectedBarcodes: [Barcode]
    var subjects: [SubjectObservation]
    var imageQuality: ImageQuality
}
```

The Foundation Model receives this context alongside the image.

---

# 64. Image Pipeline

Before model analysis:

```text
Captured UIImage
      ↓
Orientation normalization
      ↓
Pixel format normalization
      ↓
Image quality
      ↓
Vision analysis
      ↓
Model prompt
```

Don't blindly pass giant full-resolution images around.

Use an appropriate working representation.

---

# 65. Concurrency

Camera work must not block the main actor.

Use:

```swift
@MainActor
final class CameraViewModel
```

for UI state.

Camera session management should be isolated appropriately.

Vision analysis:

```swift
async
```

Foundation Model:

```swift
async
```

Persistence:

background-safe operations where appropriate.

---

# 66. State Machine

The camera screen should explicitly model state.

```swift
enum ExplainState {
    case ready
    case capturing
    case analyzing
    case generating
    case complete(ExplanationResult)
    case error(ExplainError)
}
```

This avoids spaghetti Boolean state such as:

```swift
isLoading
isAnalyzing
showError
isGenerating
hasResult
...
```

---

# 67. Result State

```text
ready
 ↓
capturing
 ↓
analyzing
 ↓
generating
 ↓
complete
```

Error can occur from any stage.

---

# 68. Error Taxonomy

Define:

```swift
enum ExplainError: Error {
    case cameraUnavailable
    case permissionDenied
    case imageTooPoor
    case visionFailed
    case modelUnavailable
    case modelRefused
    case generationFailed
    case sessionExpired
    case cancelled
    case unknown
}
```

Then map each to a human-readable UI message.

---

# 69. Testing Strategy

This app needs **much more AI testing than a normal CRUD app**.

We need four testing layers.

## Layer 1

Unit tests.

## Layer 2

Vision tests.

## Layer 3

AI evaluation.

## Layer 4

UI/device tests.

---

# 70. Vision Test Dataset

Build a test set containing:

### Objects

* keyboard
* mouse
* engine
* bicycle
* plant
* flower
* screwdriver
* camera
* headphones

### Difficult images

* blurry
* dark
* partial object
* crowded scene
* unusual angle
* reflective surface

### Text

* textbook
* handwritten
* sign
* receipt
* menu
* label

---

# 71. Foundation Models Evaluation Dataset

Create a fixed benchmark.

Example:

```text
001 — Carburetor
002 — Transistor
003 — Photosynthesis diagram
004 — Coffee grinder
005 — Circuit board
006 — Brake caliper
007 — Telescope
008 — Leaf
009 — Painting
010 — Mathematical equation
```

Each has expected qualitative behavior.

---

# 72. AI Acceptance Tests

For every benchmark:

### Accuracy

Does it identify the primary subject?

### Definition

Is the definition technically correct?

### Simplicity

Can a non-expert understand it?

### Consistency

Does the simple explanation agree with the definition?

### Uncertainty

Does it avoid false confidence?

### Follow-up

Are questions relevant?

### Safety

Does it avoid dangerous advice?

---

# 73. Example AI Test

Input:

Carburetor photo.

Expected:

```text
subject:
carburetor
```

Definition must mention:

```text
air + fuel + engine
```

Simple explanation should include an analogy or intuitive description.

It must **not** say:

> carburetor injects fuel directly into the cylinder.

That would be a factual failure in this context.

---

# 74. AI Regression Testing

Whenever Apple changes the Foundation Model:

```text
Run benchmark
      ↓
Compare outputs
      ↓
Check failures
      ↓
Update prompt if necessary
      ↓
Re-run
```

Apple specifically notes model changes across OS releases and provides Foundation Models instrumentation for examining latency, prompts, output, tools and token usage. ([Apple Developer][4])

---

# 75. Performance Targets

These should be **targets, not promises**, because on-device model performance varies by device.

### Camera launch

Target:

**< 500 ms perceived readiness**

---

### Capture

Target:

**immediate visual feedback**

---

### Vision preprocessing

Target:

**< 1 second**

---

### First generated content

Target:

**as soon as possible after analysis**

---

### Full explanation

Target:

**few seconds on capable devices**

---

# 76. Performance Instrumentation

Track locally during development:

```text
cameraStartup
captureLatency
visionLatency
modelTimeToFirstToken
modelTotalGenerationTime
toolCallCount
totalSessionTime
```

Don't ship detailed prompt/content telemetry by default.

---

# 77. Battery

Do **not** continuously run Foundation Models against camera frames.

Architecture:

```text
LIVE CAMERA
   ↓
lightweight preview
   ↓
USER CAPTURES
   ↓
ONE ANALYSIS
```

This is significantly more sensible for battery, thermal and latency.

---

# 78. Thermal Management

If the user repeatedly scans:

* avoid keeping model sessions alive unnecessarily
* release large image buffers
* downsample temporary images
* avoid continuous Vision analysis unless needed
* stop camera when leaving the capture view

---

# 79. Memory Management

Images are potentially large.

Never keep:

```text
camera frame
+
processed image
+
Vision image
+
model image
+
thumbnail
```

all alive unnecessarily.

Use lifecycle-scoped resources.

---

# 80. App Launch Requirements

First launch:

```text
WATDA?!
```

Then directly:

```text
Camera permission
```

No account.

No mandatory tutorial.

---

# 81. First-run Education

After camera permission:

A subtle overlay:

> **Point at anything.**
>
> **We'll explain it.**

Then disappears.

That's the entire onboarding.

---

# 82. Unsupported Device UX

If the device cannot use Foundation Models:

```text
WATDA?!

Your iPhone can use WATDA?!'s
camera and visual tools, but
AI explanations require an
Apple Intelligence-compatible
device.

Learn more
```

Do not crash.

Do not show a dead camera.

---

# 83. iOS 17.6 Product Decision

This needs to be explicit in the engineering ticket:

> **Minimum deployment target is 17.6, but the AI feature is conditionally available based on Foundation Models and Apple Intelligence availability.**

If the goal is instead:

> "Every supported device must have AI explanations."

then the correct minimum OS should be raised to the minimum OS required by Foundation Models.

You cannot simultaneously guarantee **Apple Foundation Models on every iOS 17.6 device** and maintain iOS 17.6 support. Apple's framework requires Apple Intelligence-capable hardware/software. ([Apple Developer][10])

---

# 84. App Store Positioning

## Category

**Education**

Secondary possibility:

**Utilities**

I prefer Education because the core value proposition is understanding/learning.

---

# 85. App Store Subtitle

Possible:

> **Point. Snap. Understand.**

---

# 86. App Store Description

### Short pitch

> **Point at anything. WATDA?! explains it.**

### Longer description

> Ever looked at something and thought, “What even is that?”
>
> Point your camera at it.
>
> WATDA?! helps you understand what you're looking at with:
>
> **WHAT IS IT?**
> Get a clear, accurate definition.
>
> **EXPLAIN IT SIMPLY**
> Get the same idea explained in plain language.
>
> **GO DEEPER**
> Explore how it works, why it matters, and what makes it interesting.
>
> Ask follow-up questions and keep exploring.
>
> Built around Apple's on-device intelligence and Vision technologies on supported devices.

---

# 87. Privacy Positioning

Strong marketing point:

> **Your curiosity doesn't need an account.**

And:

> **Built with Apple's on-device intelligence.**

Don't make absolute claims such as "nothing ever leaves your device" unless the implemented product architecture guarantees that across every capability/version.

---

# 88. Monetization

I would **not monetize immediately**.

First prove:

```text
Capture → Explanation → Repeat
```

Potential later models:

### Free

5–10 explanations/day.

### Pro

Unlimited explanations.

### One-time purchase

Potentially attractive for an indie native app.

But don't decide this before retention data.

---

# 89. Analytics

For MVP, if you use analytics at all, keep them minimal and privacy-conscious.

Useful events:

```text
app_opened
camera_ready
capture_started
capture_completed
explanation_completed
followup_started
scan_saved
scan_shared
```

Avoid collecting:

```text
captured image
full user questions
full model responses
OCR content
```

unless there is a clearly justified, disclosed reason.

---

# 90. Core Product Metrics

## North Star Metric

### **Successful explanations per active user**

Not:

> app opens.

Not:

> camera launches.

The product exists to produce understanding.

---

# 91. Secondary Metrics

### Activation

Percentage of users who complete first explanation.

### First-value time

Time:

```text
first launch → first completed explanation
```

### Repeat usage

Users who scan again within:

* 1 day
* 7 days
* 30 days

### Follow-up rate

Percentage of scans where user asks another question.

This is especially important.

If people ask:

> "Why?"

after seeing the first explanation, the product is working.

---

# 92. Product Success Criteria

MVP is successful if users naturally:

1. open camera,
2. capture something,
3. read explanation,
4. ask another question,
5. scan something else later.

The strongest behavioral signal is:

> **"I saw one thing and immediately pointed at another."**

---

# 93. Definition of Done — MVP

The MVP is not done until:

### Camera

* permissions work
* orientation works
* interruptions work
* backgrounding works
* camera releases properly

### Vision

* OCR works
* image quality detection works
* analysis doesn't block UI

### Foundation Models

* availability handled
* structured output works
* image prompts work
* session works
* streaming works
* failures handled

### UI

* Dynamic Type works
* VoiceOver works
* dark/light works
* Reduce Motion works
* all loading states work
* all error states work

### Persistence

* scans save correctly
* deleted scans disappear
* app restart preserves data

### Privacy

* no accidental uploads
* permissions correctly declared
* no unnecessary collection

---

# 94. QA Matrix

Test on:

### OS

* iOS 17.6
* latest supported iOS
* iOS 27

### Hardware classes

* older supported device
* non-Apple-Intelligence device
* Apple-Intelligence-capable device
* current flagship

### Conditions

* Wi-Fi
* cellular
* airplane mode
* low battery
* low storage
* camera denied
* Photos denied
* background interruption
* phone call interruption

---

# 95. AI Failure Test Matrix

Test:

```text
Object
Multiple objects
No obvious object
Blurry image
Dark image
Text
Handwriting
Diagram
Person
Animal
Plant
Food
Machine
Medical
Dangerous object
Artwork
Screenshot
```

For every category ask:

> Does WATDA?! produce a useful answer without pretending certainty?

---

# 96. Security Requirements

No:

* API keys embedded in app
* unnecessary network calls
* user image uploads
* sensitive logs
* raw prompt logging in production

If future external model providers are introduced:

* credentials remain server-side
* user images require explicit documented processing
* privacy policy updated
* App Store privacy disclosure updated

---

# 97. Logging

Development:

```text
[Camera]
[Vision]
[FoundationModels]
[Persistence]
```

Production:

Only safe operational diagnostics.

Never log:

```text
captured image
OCR text
user questions
model responses
```

by default.

---

# 98. App Architecture Rule

One of the most important rules:

> **The UI should never know which model produced the explanation.**

SwiftUI only sees:

```swift
ExplanationResult
```

It shouldn't care whether it came from:

* Foundation Models
* future Private Cloud Compute
* future server model
* test fixture

This makes the product future-proof.

---

# 99. Future Intelligence Architecture

Eventually:

```text
                  ExplainEngine
                       │
       ┌───────────────┼────────────────┐
       │               │                │
       ▼               ▼                ▼
Foundation        Private Cloud      Other Model
Models            Compute            Provider
```

Apple's current `LanguageModel` abstraction is explicitly designed to let applications work with different model implementations. ([Apple Developer][11])

But **Foundation Models remains the default.**

---

# 100. The "Wow" Feature Roadmap

After MVP, the feature I'd prioritize above everything else is:

# **Tap a part.**

User photographs a car engine.

The app visually identifies:

```text
○ Alternator

○ Carburetor

○ Air filter

○ Battery
```

User taps:

> **Carburetor**

Then:

> **That's the carburetor.**

And the app explains it.

This transforms the app from:

**AI camera**

into:

# **an interactive lens for understanding reality.**

---

# 101. Future "Explain Everything"

Eventually the camera becomes a spatial tutor.

Point at:

### A bicycle

> "How does this work?"

App:

> "There are four important systems here."

Highlights them.

### A building

> "Why is it shaped like this?"

### A circuit

> "Trace the electricity."

### A plant

> "Which parts are responsible for photosynthesis?"

That is the long-term moat.

---

# 102. Future AR Layer

Not MVP.

Potentially:

```text
         ENGINE

     ┌─────────────┐
     │             │
     │   ○─────→   │
     │ carburetor  │
     │             │
     └─────────────┘
```

Labels remain spatially attached to the real-world object.

---

# 103. Product Moat

The Foundation Model itself isn't the moat.

Anyone can build:

> camera + AI.

The moat becomes:

### 1. Explanation UX

Definition → simple → deep.

### 2. Visual interaction

Point → tap → understand.

### 3. Explanation quality

Consistent, accurate, analogy-driven output.

### 4. Evaluation dataset

Thousands of visual prompts + expected behaviors.

### 5. Personal knowledge history

Everything the user has explored.

### 6. Educational progression

Explain → question → quiz → remember.

That's the defensibility.

---

# 104. Development Milestones

## Sprint 1 — Foundation

* Xcode project
* SwiftUI architecture
* design system
* camera
* permissions
* deployment compatibility

---

## Sprint 2 — Vision

* image capture
* OCR
* quality analysis
* subject analysis
* unified `VisualContext`

---

## Sprint 3 — Foundation Models

* availability
* session
* multimodal prompt
* `@Generable`
* structured result

---

## Sprint 4 — Explanation UI

* definition
* simple explanation
* analogy
* follow-up questions
* streaming

---

## Sprint 5 — Conversation

* session persistence
* follow-ups
* context
* error handling

---

## Sprint 6 — History

* SwiftData
* thumbnails
* scan detail
* deletion

---

## Sprint 7 — Hardening

* accessibility
* performance
* memory
* camera interruptions
* device matrix
* AI regression tests

---

## Sprint 8 — TestFlight

* internal QA
* external beta
* crash monitoring
* AI quality evaluation
* prompt refinement

---

# 105. Engineering Deliverables

You should create these documents/files alongside the PRD.

## 01 — PRD

This document.

```text
PRD.md
```

---

## 02 — Technical Architecture

```text
ARCHITECTURE.md
```

Contains:

* module boundaries
* data flow
* concurrency
* Foundation Models integration
* Vision integration
* persistence
* availability strategy

---

## 03 — AI Specification

```text
AI_SPEC.md
```

Contains:

* system instructions
* prompt versions
* structured schemas
* safety rules
* confidence behavior
* model errors
* evaluation strategy

---

## 04 — UX Specification

```text
UX_SPEC.md
```

Contains:

* every screen
* every state
* transitions
* copy
* accessibility
* empty states
* errors

---

## 05 — Data Model

```text
DATA_MODEL.md
```

Contains:

* SwiftData entities
* relationships
* migrations
* storage policy

---

## 06 — Vision Specification

```text
VISION_SPEC.md
```

Contains:

* OCR
* barcode
* image quality
* subject analysis
* image preprocessing
* Vision fallback behavior

---

## 07 — Testing Plan

```text
TEST_PLAN.md
```

Contains:

* unit tests
* integration tests
* UI tests
* Vision dataset
* AI evaluation dataset
* regression tests

---

## 08 — Security & Privacy

```text
PRIVACY_SECURITY.md
```

Contains:

* data flow
* permissions
* local storage
* logging
* future network architecture
* App Store privacy declarations

---

## 09 — Release Checklist

```text
RELEASE_CHECKLIST.md
```

Contains:

* build
* signing
* TestFlight
* screenshots
* metadata
* privacy
* crash checks
* device tests

---

# 106. Recommended Repository

```text
WATDA/
│
├── README.md
├── PRD.md
├── ARCHITECTURE.md
├── AI_SPEC.md
├── UX_SPEC.md
├── VISION_SPEC.md
├── DATA_MODEL.md
├── TEST_PLAN.md
├── PRIVACY_SECURITY.md
├── RELEASE_CHECKLIST.md
│
├── WATDA/
│   ├── App/
│   ├── Camera/
│   ├── Intelligence/
│   ├── Vision/
│   ├── Models/
│   ├── Persistence/
│   ├── Features/
│   ├── UI/
│   └── Resources/
│
└── WATDATests/
```

---

# 107. The MVP Contract

If we need to ruthlessly cut scope, this is the contract:

> **A user can open WATDA?!, point their camera at something, capture it, and on a supported Apple Intelligence device receive a technically accurate definition plus a simple explanation, then ask follow-up questions about the same image.**

Everything else is secondary.

---

# 108. Final Product Definition

I would define WATDA?! in one sentence as:

> **WATDA?! is an on-device visual tutor that turns anything you point your iPhone at into a clear, layered explanation.**

And the UX hierarchy is:

```text
              SEE SOMETHING
                    │
                    ▼
                POINT AT IT
                    │
                    ▼
                 CAPTURE
                    │
                    ▼
              WHAT IS IT?
                    │
                    ▼
           ┌─────────────────┐
           │ ACCURATE FACT   │
           └────────┬────────┘
                    │
                    ▼
           ┌─────────────────┐
           │ SIMPLE EXPLAIN  │
           └────────┬────────┘
                    │
                    ▼
               GET CURIOUS
                    │
          ┌─────────┼─────────┐
          ▼         ▼         ▼
        WHY?      HOW?     DEEPER
          │         │         │
          └─────────┼─────────┘
                    ▼
               UNDERSTAND
                    │
                    ▼
             "WHAT ELSE?"
                    │
                    ▼
              POINT AGAIN
```

That last step is the product loop.

**The objective isn't to make an AI that identifies objects. The objective is to make people naturally curious about the world around them.**

And the technical foundation is very well aligned with Apple's current stack: Vision provides on-device visual analysis such as OCR, barcode detection, segmentation and classification; Foundation Models provides multimodal understanding, structured generation, sessions, streaming and tool calling; and Apple's latest documentation explicitly describes combining Vision tools with image prompts for Foundation Models.