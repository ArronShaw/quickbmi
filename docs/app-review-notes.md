# App Review Information — notes for App Store Connect

## 2026-08-17 — Guideline 1.4.1 (Safety - Physical Harm), v2.0 (4)

Reviewer feedback: the app shows BMI category thresholds without citing a
source. Fix: added a persistent, always-visible link under the Calculate
button (not gated behind pressing Calculate) crediting the source —
`ContentView.swift`, footer of the Calculate section:

> BMI formula & category ranges: CDC, About Adult BMI
> https://www.cdc.gov/bmi/adult-calculator/about.html

The BMI formula and the four category thresholds (18.5 / 25 / 30) already
in `BMICalculator.swift` match the CDC's published adult BMI categories
exactly, so no calculation logic changed — only the missing citation was
added, visible on the main screen without needing to calculate first.

Suggested Resolution Center reply for this one:
> Thank you for the feedback. We've added a citation directly on the main
> screen (footer under the Calculate button, always visible) linking to the
> CDC's "About Adult BMI" page, which is the source for the BMI formula and
> the four category thresholds (Underweight/Normal/Overweight/Obese) used in
> the app. This is included in build 2.0 (5).

---

## Guideline 2.1 (Information Needed) response — reference

Paste this into **App Store Connect → App Review → Notes** (and into the
Resolution Center reply, alongside the video attachment) on the next
submission, in response to the Guideline 2.1 information request. Numbering
below matches Apple's "Next Steps" list exactly.

---

**1. Screen recording**
Attached to this reply, captured on a physical device running the latest iOS.
The recording starts at launch and shows the app's entire user flow: unit
toggle, entering height/weight, calculating, and the validation alert. None
of the flagged categories apply to this app, so none appear in the
recording:
- No account registration, login, or account deletion — the app has no
  accounts at all.
- No paid content, purchases, or subscriptions — the app is free with no
  paid tier.
- No user-generated content — so no reporting/blocking mechanisms exist.
- No prompts for location, contacts, camera, App Tracking Transparency, or
  any other sensitive data/device capability — the app requests zero
  permissions.

**2. Devices / OS tested on before this submission**
_(fill in with the actual device(s) and iOS version used for the recording —
see docs/log.md for what's been used so far; update this line with the
exact model, e.g. "iPhone 17, iOS 26.x")._

**3. App functions & target audience**
QuickBMI is a single-screen utility that calculates Body Mass Index (BMI)
from user-entered height and weight. The user picks a unit system (Imperial
or Metric), enters height and weight, taps Calculate, and sees their BMI
plus its category (Underweight / Normal / Overweight / Obese). Target
audience is any adult iPhone user who wants a quick, no-signup BMI lookup —
it solves the "I need my BMI right now without an account or ads" problem.

**4. Setup / access instructions**
No account, login, or credentials of any kind. There is nothing to
configure — install and launch; the calculator is immediately usable. No
sample files or demo data needed.

**5. External services / third parties**
None. The app performs the BMI calculation locally on-device with no
network calls, analytics, ads, crash reporting, authentication providers,
payment processors, or AI services of any kind.

**6. Regional differences**
None — the app functions identically in every region/locale. The only
variable is which unit system (Imperial vs. Metric) the user selects, and
that toggle is available everywhere, not tied to region.

**7. Regulated industry / protected material**
Not applicable. QuickBMI does not provide medical advice, diagnosis, or
treatment — it displays a standard, publicly documented BMI formula
(`weight_kg / height_m²`) and the WHO's standard four BMI category bands.
No licensed, regulated, or third-party-protected content is used.

---

## Screen recording checklist (for item 1 above)

Record on a **physical device** running the latest iOS, starting from app
launch, and show:
1. Cold launch of QuickBMI from the Home Screen.
2. Toggling the Units segmented control between Imperial and Metric.
3. Entering a height + weight in Imperial, tapping Calculate, showing the
   BMI number and category.
4. Switching to Metric, entering values, tapping Calculate again.
5. Triggering the validation alert with an invalid/empty input.

That's the entire user flow — there's no login, purchase, UGC, or permission
prompt to additionally capture, since the app has none of those.
