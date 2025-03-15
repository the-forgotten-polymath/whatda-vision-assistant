# WATDA?! --- UX Specification

## 1. Design Direction

**Native iOS + playful intelligence.**

Avoid generic AI aesthetics:

-   no purple AI gradients
-   no chatbot-first layout
-   no giant prompt field
-   no dashboard as the home screen

Use:

-   camera-first composition
-   large typography
-   system materials
-   subtle motion
-   strong hierarchy
-   high contrast
-   minimal controls

------------------------------------------------------------------------

# 2. Home / Camera

The camera is the home screen.

``` text
┌───────────────────────────────┐
│ WATDA?!                  History
│                               │
│                               │
│                               │
│          LIVE CAMERA          │
│                               │
│                               │
│                               │
│                               │
│                               │
│             ◉                 │
│                               │
│        Photos                 │
└───────────────────────────────┘
```

The capture button is the primary CTA.

------------------------------------------------------------------------

# 3. Capture Animation

On capture:

``` text
Live camera
   ↓
Freeze frame
   ↓
Subtle focus pulse
   ↓
"Looking..."
   ↓
Subject
   ↓
Definition
   ↓
Simple explanation
```

Avoid a generic spinner.

------------------------------------------------------------------------

# 4. Result Screen

Hierarchy:

1.  Image.
2.  Subject.
3.  What is it?
4.  Explain it simply.
5.  Analogy.
6.  Follow-up questions.
7.  Go deeper.

------------------------------------------------------------------------

# 5. Result Copy

### Subject

Large, prominent.

### Definition

Label:

> WHAT IS IT?

### Simple

Label:

> EXPLAIN IT SIMPLY

### Analogy

Label:

> THINK OF IT LIKE...

### Follow-ups

Label:

> WANT TO KNOW MORE?

------------------------------------------------------------------------

# 6. Loading States

### Vision

> Looking closely...

### Foundation Models

> Figuring this out...

### Streaming

Render content as it arrives.

Never use:

> "AI processing..."

------------------------------------------------------------------------

# 7. Error Copy

### Bad image

> I can't see this clearly.

> Try moving closer or adding some light.

### Unknown

> I can't confidently identify this yet.

> Try another angle or a closer photo.

### Model unavailable

> AI explanations aren't available on this device.

> WATDA?! needs Apple Intelligence on a supported device for on-device
> explanations.

### Model not ready

> WATDA?! is waiting for Apple Intelligence to become ready.

### Generic failure

> Something went sideways.

Buttons:

-   Try again
-   Take another photo

------------------------------------------------------------------------

# 8. Follow-Up UI

Use compact chips:

``` text
[ How does it work? ]
[ Why is it needed? ]
[ What's inside? ]
[ Tell me something cool ]
```

The user can also type a custom question.

------------------------------------------------------------------------

# 9. Conversation

Follow-up screen keeps:

-   image header
-   subject
-   conversation

Do not use a conventional full-screen ChatGPT clone.

Prefer:

``` text
Image
Subject
────────────

You:
Why does it need air?

WATDA?!:
...

[Ask anything...]
```

------------------------------------------------------------------------

# 10. Deep Dive

"Go deeper" opens a progressively detailed explanation.

Sections may include:

-   How it works.
-   Main components.
-   Cause and effect.
-   Technical terminology.
-   Example.

Avoid giant walls of text.

------------------------------------------------------------------------

# 11. History

``` text
HISTORY

Today
────────────
Carburetor
Mechanical keyboard
Monstera plant

Yesterday
────────────
Transistor
Telescope
```

Use image thumbnails.

------------------------------------------------------------------------

# 12. Empty History

> Nothing here yet.

> Point your camera at something curious.

CTA:

**Start exploring**

------------------------------------------------------------------------

# 13. Accessibility

Every interactive element must have:

-   label
-   hint where useful
-   correct traits

Examples:

``` swift
.accessibilityLabel("Capture and explain")
.accessibilityHint("Takes a photo and explains what you're looking at")
```

------------------------------------------------------------------------

# 14. Motion

Motion should communicate state, not decoration.

Respect:

``` swift
@Environment(\.accessibilityReduceMotion)
```

When Reduce Motion is enabled:

-   disable scanning animation
-   reduce transitions
-   avoid parallax
-   retain essential state changes

------------------------------------------------------------------------

# 15. Typography

Prefer system typography:

``` text
.largeTitle
.title
.title2
.headline
.body
.callout
.caption
```

Use Dynamic Type rather than hard-coded font sizes.

------------------------------------------------------------------------

# 16. Color

Core palette should work in:

-   light mode
-   dark mode

Do not rely on color alone for confidence states.

Use:

-   icon
-   text
-   label
-   subtle visual indicator

------------------------------------------------------------------------

# 17. Share Card

A share card contains:

-   captured image
-   subject
-   definition
-   simple explanation
-   WATDA?! branding

Use native ShareLink.

------------------------------------------------------------------------

# 18. Settings

Settings:

-   Appearance
-   Save scans
-   Haptics
-   Privacy
-   About

Avoid settings that expose implementation complexity.

------------------------------------------------------------------------

# 19. First-Run Experience

No tutorial carousel.

After permission:

> Point at anything.

Then:

> We'll explain it.

Then camera.

------------------------------------------------------------------------

# 20. UX Principle

The product should feel like:

> **A magic lens for curiosity.**

Not:

> A chatbot that happens to have a camera.
