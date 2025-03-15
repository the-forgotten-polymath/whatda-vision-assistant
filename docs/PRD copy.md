# WATDA?! --- Product Requirements Document

**Working name:** WATDA?!\
**Tagline:** Point at it. WATDA?! explains it.\
**Platform:** iPhone\
**UI:** SwiftUI\
**Deployment target:** iOS 17.6+\
**Primary intelligence:** Apple Foundation Models on supported Apple
Intelligence devices\
**Computer vision:** Apple Vision / VisionKit\
**Persistence:** SwiftData\
**Architecture:** Native Swift, Swift Concurrency, protocol-oriented
services\
**Document status:** Build-ready v1.0

------------------------------------------------------------------------

## 1. Product Summary

WATDA?! is an on-device visual tutor. A user points the iPhone camera at
something unfamiliar, captures it, and receives a layered explanation:

1.  **What is it?** --- concise, technically accurate definition.
2.  **Explain it simply** --- intuitive explanation, usually with a
    concrete analogy.
3.  **Go deeper** --- progressively more technical detail.
4.  **Ask** --- follow-up questions that remain grounded in the original
    image and session.

The product is not primarily an object-identification app.
Identification is the first step; the product value is
**understanding**.

### Core loop

``` text
See something
    ↓
Point at it
    ↓
Capture
    ↓
Vision gathers visual context
    ↓
Foundation Models interprets the image/context
    ↓
Definition + simple explanation
    ↓
User asks why/how/what-next
    ↓
User points at something else
```

------------------------------------------------------------------------

## 2. Problem

People constantly encounter objects, symbols, diagrams, machines,
plants, signs, interfaces, and concepts they do not understand.
Traditional search requires the user to know enough about the thing to
formulate a useful query.

WATDA?! removes that prerequisite:

> **You do not need to know what something is before you can ask what it
> is.**

------------------------------------------------------------------------

## 3. Product Goals

### Primary goals

-   Make visual understanding possible in seconds.
-   Provide both precision and simplicity.
-   Use Apple Vision for deterministic visual extraction.
-   Use Apple Foundation Models for on-device reasoning and explanation
    on supported devices.
-   Preserve conversation context for follow-up questions.
-   Make uncertainty explicit.
-   Work gracefully across iOS 17.6+ devices.
-   Keep the core experience account-free and local-first.
-   Feel native to iOS rather than like a web chatbot wrapped in
    SwiftUI.

### Non-goals for v1

-   Social network.
-   Public profiles.
-   Cloud AI dependency.
-   Web search.
-   AR overlays.
-   Voice assistant.
-   Gamification/streaks.
-   Subscription before product-market validation.
-   Continuous camera-to-model inference.

------------------------------------------------------------------------

## 4. Target Users

### Curious general user

Wants a quick explanation of everyday objects.

### Student

Wants to understand textbook images, diagrams, scientific equipment, and
unfamiliar concepts.

### Technical learner

Wants definition → intuition → technical depth.

### Parent/child

Wants a quick answer to "what is that?"

### Traveler

Wants context about signs, architecture, monuments, objects, and
artwork.

------------------------------------------------------------------------

## 5. Product Principles

1.  **Camera first.**
2.  **Definition before simplification.**
3.  **Simple does not mean childish.**
4.  **Never manufacture confidence.**
5.  **Separate observation from inference internally.**
6.  **One strong analogy is better than five weak ones.**
7.  **The model provides intelligence; the app owns presentation.**
8.  **The UI must remain useful when intelligence is unavailable.**
9.  **No continuous AI processing of the live camera feed in v1.**
10. **Every failure has a human-readable recovery path.**

------------------------------------------------------------------------

## 6. Core User Journey

### First launch

1.  Launch app.
2.  Request camera permission.
3.  Show a one-line overlay: "Point at anything. We'll explain it."
4.  Enter camera.

No account. No mandatory carousel.

### Standard scan

1.  User frames subject.
2.  User taps capture.
3.  Captured image freezes.
4.  Vision performs image analysis.
5.  Foundation Models generates structured explanation.
6.  UI progressively reveals the result.
7.  User can ask follow-up questions.
8.  User can save/share the scan.

------------------------------------------------------------------------

## 7. Primary Result Contract

Every successful initial scan should attempt to provide:

-   Subject name.
-   Confidence state.
-   Accurate definition.
-   Simple explanation.
-   Optional analogy.
-   Optional interesting fact.
-   Useful observations.
-   3--4 follow-up questions.

Example:

### Carburetor

**What is it?**

> A carburetor is a mechanical device that mixes air and fuel in the
> correct proportion before the mixture enters an internal-combustion
> engine.

**Explain it simply**

> Think of it like a chef mixing ingredients. An engine needs air and
> fuel to make power, and the carburetor prepares the mixture before the
> engine burns it.

**Go deeper**

Explain the venturi effect, fuel jet, throttle plate, and mixture
behavior.

------------------------------------------------------------------------

## 8. Information Architecture

Only two primary destinations:

-   **Camera**
-   **History**

Settings are secondary.

The default launch destination is Camera.

------------------------------------------------------------------------

## 9. Camera Requirements

The camera experience must:

-   Use rear camera by default.
-   Support autofocus.
-   Support exposure adjustment.
-   Support torch where hardware permits.
-   Handle device rotation.
-   Handle camera interruptions.
-   Handle app background/foreground.
-   Stop/release capture resources when leaving the camera.
-   Provide clear permission-denied UI.
-   Provide immediate capture feedback.
-   Avoid passing live frames continuously to Foundation Models.

------------------------------------------------------------------------

## 10. Vision Responsibilities

Vision is the deterministic perception layer.

Use it for:

-   Text recognition.
-   Barcode detection.
-   Document structure.
-   Subject/region observations where useful.
-   Image quality checks.
-   Optional segmentation/tap-to-explain support in later versions.

The current Vision API provides modern async image-analysis requests
including text and document recognition; Vision processing is designed
for on-device use. See Apple's Vision documentation:
https://developer.apple.com/documentation/vision

------------------------------------------------------------------------

## 11. Foundation Models Responsibilities

Foundation Models is the semantic layer.

Use it for:

-   Visual interpretation.
-   Definition generation.
-   Simple explanation.
-   Analogies.
-   Follow-up answers.
-   Structured generation.
-   Session context.
-   Tool selection where a tool is genuinely useful.

The app must check `SystemLanguageModel.default.availability` before
use.

Availability can distinguish cases such as:

-   Apple Intelligence not enabled.
-   Device not eligible.
-   Model not ready.

------------------------------------------------------------------------

## 12. Compatibility Strategy

The deployment target remains **iOS 17.6+**, but Foundation Models is
conditionally available.

### Full intelligence

On a supported OS/device with Apple Intelligence and a ready Foundation
Model:

-   Vision
-   Foundation Models
-   structured generation
-   streaming
-   follow-up session
-   tools

### Compatibility mode

On unsupported devices/OS versions:

-   Camera remains functional.
-   Vision functionality may remain available.
-   History remains available.
-   Explain screen clearly states that on-device AI requires an Apple
    Intelligence-capable device.

Do not pretend that Foundation Models exists on an arbitrary iOS 17.6
device.

If the product requirement becomes "AI explanations must work on every
supported device", raise the deployment target to the minimum Foundation
Models OS rather than introducing a fake compatibility layer.

------------------------------------------------------------------------

## 13. Conversation Model

Each captured image creates a `ScanSession`.

The session contains:

-   Captured image reference.
-   Vision context.
-   Initial explanation.
-   Foundation Models session.
-   User/model messages.
-   Creation timestamp.

Follow-up questions should reuse the same model session while context
remains valid.

------------------------------------------------------------------------

## 14. History

A saved scan contains:

-   UUID.
-   Date.
-   Subject.
-   Definition.
-   Simple explanation.
-   Analogy.
-   Fun fact.
-   Category.
-   Confidence.
-   Image thumbnail/path.
-   Optional conversation messages.

Temporary camera frames must not be persisted.

------------------------------------------------------------------------

## 15. Privacy

v1 should be local-first:

-   No mandatory account.
-   No required backend.
-   No required image upload.
-   No location requirement.
-   No contacts.
-   No microphone.
-   Do not log raw images, OCR text, user prompts, or model responses in
    production by default.

The privacy model should be reflected in the privacy policy and App
Store disclosures.

------------------------------------------------------------------------

## 16. Safety

WATDA?! is an educational explainer, not a professional decision system.

Special handling is required for:

-   Medical topics.
-   Medication labels.
-   Financial documents.
-   Legal documents.
-   Dangerous machinery.
-   Weapons.
-   Hazardous substances.

For high-stakes topics, the app should explain visible information
without presenting a visual guess as a professional diagnosis or
instruction.

------------------------------------------------------------------------

## 17. Accessibility

Required:

-   Dynamic Type.
-   VoiceOver.
-   Reduce Motion.
-   Increase Contrast.
-   Large Content Size categories.
-   Voice Control.
-   Semantic labels for controls.
-   Minimum comfortable touch targets.
-   Sufficient contrast.

Camera capture must have an explicit accessibility label such as:

> "Explain what I'm looking at."

------------------------------------------------------------------------

## 18. MVP Scope

### Must ship

-   Camera.
-   Capture.
-   Image preprocessing.
-   Vision OCR.
-   Vision context.
-   Foundation Models availability check.
-   Multimodal model request.
-   Structured response.
-   Streaming/progressive result.
-   Definition.
-   Simple explanation.
-   Analogy when appropriate.
-   Follow-up questions.
-   Follow-up session.
-   History.
-   Error states.
-   Accessibility.
-   Dark/light/system appearance.
-   iOS 17.6+ graceful compatibility.

### Explicitly out of scope

-   Accounts.
-   Social feed.
-   Cloud database.
-   Web search.
-   Voice.
-   AR.
-   Quizzes.
-   Streaks.
-   Public profiles.

------------------------------------------------------------------------

## 19. V1.1

-   Photo Library import.
-   Tap-to-explain.
-   Better document mode.
-   Share cards.
-   Favorites.
-   "Make it simpler."
-   "Explain technically."
-   Improved subject-region selection.

------------------------------------------------------------------------

## 20. V1.5

Teach Mode:

``` text
What is it?
    ↓
How does it work?
    ↓
Why does it matter?
    ↓
Interesting fact
```

------------------------------------------------------------------------

## 21. V2

Interactive visual tutor:

-   Identify multiple regions.
-   Tap a region.
-   Explain that region.
-   Ask questions about a region.
-   Guided visual exploration.
-   Optional quiz mode.

------------------------------------------------------------------------

## 22. Product Metrics

### North Star

**Successful explanations per active user.**

### Secondary

-   First explanation completion rate.
-   Time from launch to first explanation.
-   Repeat scan rate.
-   7-day retention.
-   Follow-up-question rate.
-   Save/share rate.
-   Model failure rate.
-   User-reported "wrong explanation" rate.

The strongest behavioral signal is:

> User scans one thing and then immediately scans another.

------------------------------------------------------------------------

## 23. Definition of Done

MVP is complete only when:

-   Camera permissions work.
-   Camera interruption handling works.
-   Image orientation is correct.
-   Vision analysis runs off the main UI path.
-   Foundation Models availability is checked.
-   Structured generation failures are handled.
-   Model unavailability is handled.
-   Session cancellation works.
-   History survives app restart.
-   Accessibility passes.
-   No raw sensitive content is logged.
-   AI benchmark dataset passes acceptance thresholds.
-   Tested on supported and unsupported Foundation Models devices.
-   Tested across the minimum deployment target and current OS.

------------------------------------------------------------------------

## 24. Product Statement

> **WATDA?! is an on-device visual tutor that turns anything you point
> your iPhone at into a clear, layered explanation.**

The core UX is:

``` text
SEE
 ↓
POINT
 ↓
CAPTURE
 ↓
WHAT IS IT?
 ↓
EXPLAIN SIMPLY
 ↓
WHY / HOW / DEEPER
 ↓
UNDERSTAND
 ↓
POINT AGAIN
```
