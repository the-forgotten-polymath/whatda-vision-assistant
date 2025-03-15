# WATDA?! Engineering Documentation

This bundle contains the product and engineering specifications for
WATDA?!.

## Files

-   `PRD.md` --- product requirements and scope
-   `ARCHITECTURE.md` --- SwiftUI/Swift 6/Vision/Foundation Models
    architecture
-   `AI_SPEC.md` --- prompts, structured generation, grounding, safety
    and evaluation
-   `UX_SPEC.md` --- screen-level UX and interaction requirements
-   `TEST_PLAN.md` --- QA, AI evaluation, device and release testing

## Important platform decision

The project can retain an iOS 17.6+ deployment target, but Apple
Foundation Models is only available on supported Apple Intelligence
configurations. The app therefore needs runtime availability handling
and a graceful compatibility state.

For the full AI experience, use the current Xcode/iOS SDK and compile
the Foundation Models implementation against the SDK version actually
installed.

## Apple references

-   https://developer.apple.com/documentation/foundationmodels
-   https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel
-   https://developer.apple.com/documentation/foundationmodels/languagemodelsession
-   https://developer.apple.com/documentation/updates/foundationmodels
-   https://developer.apple.com/documentation/vision
