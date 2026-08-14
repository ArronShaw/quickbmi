# App Review Information — notes for App Store Connect

Paste this into **App Store Connect → App Review → Notes** on the next submission,
in response to the Guideline 2.1 information request.

---

**App functions & target audience**
QuickBMI is a single-screen utility that calculates Body Mass Index (BMI) from
user-entered height and weight. The user picks a unit system (Imperial or
Metric), enters height and weight, taps Calculate, and sees their BMI plus its
category (Underweight / Normal / Overweight / Obese). Target audience is any
adult iPhone user who wants a quick, no-signup BMI lookup — it solves the
"I need my BMI right now without an account or ads" problem.

**Setup / access instructions**
No account, login, or credentials of any kind. There is nothing to configure —
install and launch; the calculator is immediately usable. No sample files or
demo data needed.

**Account, purchase, UGC, or sensitive-permission flows**
None of the following exist in this app, so none are shown in the recording:
- No account registration, login, or account deletion (no accounts at all)
- No paid content, in-app purchases, or subscriptions (the app is free with
  no paid tier)
- No user-generated content, so no content reporting/blocking mechanisms
- No prompts for location, contacts, camera, photos, microphone, tracking
  (ATT), push notifications, or any other sensitive permission — the app
  requests zero permissions and has no entitlements beyond code signing

**External services / third parties**
None. The app performs the BMI calculation locally on-device with no network
calls, analytics, ads, crash reporting, authentication providers, payment
processors, or AI services of any kind.

**Regional differences**
None — the app functions identically in every region/locale. The only
variable is which unit system (Imperial vs. Metric) the user selects, and
that toggle is available everywhere, not tied to region.

**Regulated industry / protected material**
Not applicable. QuickBMI does not provide medical advice, diagnosis, or
treatment — it displays a standard, publicly documented BMI formula
(`weight_kg / height_m²`) and the WHO's standard four BMI category bands.
No licensed, regulated, or third-party-protected content is used.

**Devices / OS tested on before this submission**
_(fill in with the actual device(s) and iOS version used for the recording —
see docs/log.md for what's been used so far, e.g. a physical iPhone; update
this line with the exact model, e.g. "iPhone 17, iOS 26.x")._

---

## Screen recording checklist (Guideline 2.1, item 1)

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
