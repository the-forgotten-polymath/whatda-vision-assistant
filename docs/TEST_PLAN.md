# WATDA?! --- Test Plan

## 1. Test Objectives

Validate:

-   camera reliability
-   Vision accuracy
-   Foundation Models availability
-   structured generation
-   explanation quality
-   conversation context
-   persistence
-   accessibility
-   privacy
-   performance
-   OS/device compatibility

------------------------------------------------------------------------

# 2. Test Layers

``` text
Unit
 ↓
Integration
 ↓
Vision
 ↓
AI evaluation
 ↓
UI
 ↓
Device
 ↓
TestFlight
```

------------------------------------------------------------------------

# 3. Unit Tests

Test:

-   domain models
-   state machine
-   error mapping
-   prompt selection
-   confidence mapping
-   persistence transformations
-   image path handling

------------------------------------------------------------------------

# 4. Camera Tests

### Permission

-   first request
-   denied
-   restricted
-   settings recovery

### Lifecycle

-   background
-   foreground
-   phone call
-   interruption
-   camera unavailable

### Orientation

-   portrait
-   landscape
-   rotation during capture

------------------------------------------------------------------------

# 5. Vision Tests

Dataset categories:

``` text
objects
animals
plants
machines
electronics
documents
text
diagrams
art
difficult images
```

Difficult cases:

-   blur
-   darkness
-   glare
-   partial subject
-   multiple subjects
-   unusual angle
-   low resolution

------------------------------------------------------------------------

# 6. OCR Tests

Test:

-   printed English
-   small text
-   mixed case
-   numbers
-   labels
-   signs
-   receipts
-   multilingual text where supported

Verify that OCR context is trimmed before model prompting.

------------------------------------------------------------------------

# 7. Foundation Models Tests

On a supported Apple Intelligence device:

-   availability
-   initial generation
-   structured generation
-   streaming
-   follow-up
-   cancellation
-   context reuse
-   model-not-ready
-   Apple Intelligence disabled

------------------------------------------------------------------------

# 8. Compatibility Tests

On iOS 17.6-compatible devices without Foundation Models:

-   app launches
-   camera works
-   Vision features work where supported
-   AI unavailable state is clear
-   no crash from unavailable framework
-   history works

------------------------------------------------------------------------

# 9. AI Benchmark

Minimum benchmark:

``` text
10 engines
10 electronics
10 plants
10 animals
10 food items
10 tools
10 vehicles
10 architecture examples
10 documents
10 diagrams
10 difficult images
10 safety-sensitive images
```

At least 120 fixtures for the first serious regression suite.

------------------------------------------------------------------------

# 10. AI Scoring

Score 0--4:

-   identification
-   definition
-   simplicity
-   grounding
-   analogy
-   follow-up quality
-   safety

Target:

**≥ 3.5 average**

Critical safety failures:

**0 allowed**

Repeated hallucination pattern:

**must block release until fixed**

------------------------------------------------------------------------

# 11. Golden Test

Input:

Carburetor photo.

Required concepts:

``` text
air
fuel
engine
mixing
before combustion
```

Forbidden concepts:

``` text
claims of exact internal components not visible
claims that every modern engine uses a carburetor
false statement that it directly injects fuel
```

Simple explanation must remain consistent with the definition.

------------------------------------------------------------------------

# 12. Regression

Run the full benchmark when:

-   Xcode SDK changes.
-   iOS major version changes.
-   Foundation Model version changes.
-   Prompt version changes.
-   Vision implementation changes.

------------------------------------------------------------------------

# 13. Performance Tests

Measure:

-   camera startup
-   capture latency
-   Vision latency
-   time to first model output
-   total generation latency
-   memory peak
-   thermal behavior
-   repeated scans

Test at least:

-   cool device
-   warm device
-   low battery
-   low-power mode
-   offline mode

------------------------------------------------------------------------

# 14. Memory Tests

Repeatedly scan:

``` text
10
25
50
100
```

images.

Verify:

-   no memory growth pattern
-   temporary images are released
-   model sessions are released
-   camera resources are released

------------------------------------------------------------------------

# 15. Accessibility Tests

Test:

-   VoiceOver
-   Dynamic Type
-   largest accessibility sizes
-   Reduce Motion
-   Increase Contrast
-   Voice Control

Ensure:

-   no clipped text
-   no inaccessible capture control
-   no inaccessible result cards
-   no color-only state communication

------------------------------------------------------------------------

# 16. Persistence Tests

Test:

-   save
-   load
-   delete
-   restart app
-   corrupted/missing image
-   migration
-   duplicate IDs
-   orphan cleanup

------------------------------------------------------------------------

# 17. Privacy Tests

Verify:

-   no network call for core on-device explanation
-   no image upload
-   no raw OCR logging
-   no raw model output logging
-   camera permission is only requested when needed
-   Photos permission is only requested when user selects Photos

------------------------------------------------------------------------

# 18. UI Tests

Critical journey:

``` text
Launch
 ↓
Permission
 ↓
Camera
 ↓
Capture
 ↓
Analyze
 ↓
Result
 ↓
Follow-up
 ↓
History
 ↓
Reopen scan
```

This must be automated with mocked intelligence where hardware model
availability is unreliable.

------------------------------------------------------------------------

# 19. Release Gate

Do not ship if:

-   crash rate is unacceptable
-   camera lifecycle fails
-   Foundation Models crashes on unsupported devices
-   structured output frequently fails
-   critical AI safety failures exist
-   accessibility has major blockers
-   raw user content is logged
-   history corrupts
-   model output is frequently contradictory

------------------------------------------------------------------------

# 20. TestFlight Plan

### Internal

Engineering + product.

### External alpha

5--15 users.

Focus:

-   first-use comprehension
-   explanation quality
-   perceived latency

### Beta

30--100 users.

Focus:

-   repeat usage
-   device matrix
-   model variation
-   edge cases

------------------------------------------------------------------------

# 21. User Feedback Questions

After a completed scan, optionally ask:

> Was this explanation useful?

Buttons:

-   Yes
-   Not really

If "Not really":

> What went wrong?

-   Wrong identification
-   Too complicated
-   Too vague
-   Missing details
-   Other

Do not make this interrupt every scan. Consider a lightweight sampling
strategy.

------------------------------------------------------------------------

# 22. Acceptance Criteria

MVP can ship only when:

-   Core journey works end-to-end.
-   Full AI path works on supported devices.
-   Compatibility path works on unsupported devices.
-   No major lifecycle leaks.
-   Benchmark meets target.
-   Accessibility blockers are resolved.
-   Privacy review passes.
