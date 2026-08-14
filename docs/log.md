# QuickBMI Progress Log

## 2026-08-14

**Accomplished:**
- Apple App Review returned a Guideline 2.1 "Information Needed" request (not a bug/rejection) — asking for a demo screen recording, tested-device list, app description, setup instructions, external-services list, regional-differences note, and regulated-industry disclosure in the App Review Information notes.
- Drafted the full response in `docs/app-review-notes.md`, ready to paste into App Store Connect → App Review → Notes. Since QuickBMI has no accounts, purchases, UGC, or sensitive permissions, most sections just state that plainly with the reasoning.
- Removed the unused `aps-environment` push-notification entitlement from `QuickBMI.entitlements` — it was added automatically when enabling automatic signing but the app never used push notifications; leaving it in could raise unnecessary questions during review about an unused capability.

- Fixed the actual bug prompting the re-test: the keyboard now dismisses when Calculate is tapped (`ContentView.swift`, `FocusState`), so the result isn't hidden behind it.
- Renumbered `docs/app-review-notes.md` to match Apple's "Next Steps" list 1–7 exactly, folded the video-attachment note into item 1, bumped `CURRENT_PROJECT_VERSION` to `2` and regenerated the Xcode project.
- User recorded the demo video on a physical iPhone, archived/uploaded build 1.0 (2) via Xcode Organizer, verified the keyboard fix via TestFlight, replied in App Store Connect's Resolution Center with the numbered notes + video attachment, and **resubmitted the app for review**.

**Blockers hit today:**
- Can't produce the screen recording myself — it had to be captured on a physical device by the user.

**Next:**
- Wait for Apple's review decision on the resubmission.
- Fill in the exact tested device/iOS version line in `docs/app-review-notes.md` for the record, once confirmed.

## 2026-08-13 — no activity

## 2026-08-12 — no activity

## 2026-08-11 — no activity

## 2026-08-10 — no activity

## 2026-08-09 — no activity

## 2026-08-08 — no activity

## 2026-08-07 — no activity

## 2026-08-06 — no activity

## 2026-08-05 — no activity

## 2026-08-04 — no activity

## 2026-08-03

**Accomplished:**
- Apple Developer Program enrollment cleared — marked approved in `PLAN.md`.
- Created the App Store Connect record (name QuickBMI, bundle ID `com.aaronxu.quickbmi`, category Health & Fitness, age rating 4+, price Free) and filled in the privacy policy + support URLs.
- Switched code signing to Automatic (`DEVELOPMENT_TEAM = FC9W3726FF`) and added `QuickBMI.entitlements` (currently just `aps-environment: development`, added by Xcode when enabling automatic signing).
- Verified the app on a physical iPhone via Xcode instead of Simulator, since Simulator wasn't viable on this Mac's current resources — both unit systems, edge inputs, light/dark mode.
- Archived the build, uploaded to App Store Connect via Xcode Organizer, waited out TestFlight processing, answered the export compliance question (No), and installed/verified the build via TestFlight on the physical iPhone.
- Captured App Store screenshots on a physical iPhone 17 and resized them to 1242×2688 (`Screenshots/`, `Screenshots/resized/`).
- Filled out the App Store listing metadata and **submitted the app for App Store Review**.

**PLAN.md status:** Days 1 through 4 all checked off. Only Day 5+ (waiting on Apple's review, then publish) remains.

**Blockers hit today:**
- Simulator wasn't viable on this Mac's current resources — worked around by testing and archiving against a physical iPhone instead.

**Note:** none of today's changes (`PLAN.md`, `project.pbxproj`, `QuickBMI.entitlements`, `Screenshots/`) are committed to git yet.

**Next:**
- Wait for the App Store Review decision.
- Once approved, publish (Day 5+).

## 2026-08-02 — no activity

## 2026-08-01

**Accomplished:**
- Scaffolded the SwiftUI project via xcodegen (`project.yml` → `QuickBMI.xcodeproj`), bundle ID `com.aaronxu.quickbmi`, iPhone only.
- Implemented the BMI calculator: `BMICalculator.swift` (imperial + metric math) and `ContentView.swift` (unit toggle, Calculate button, category-colored result).
- Generated the app icon from an SVG source and added it to `Assets.xcassets`.
- Wrote and published the privacy policy + support pages to GitHub Pages: [arronshaw.github.io/quickbmi](https://arronshaw.github.io/quickbmi/) and `/privacy.html`.
- Initialized git, created `github.com/ArronShaw/quickbmi` (public), pushed everything.
- Installed full Xcode, resolved the Xcode license block (`sudo xcodebuild -license`) and pointed `xcode-select` at it.
- Downloaded the iOS 26.5 Simulator runtime (8.5 GB) and got a first successful `xcodebuild` **BUILD SUCCEEDED**.
- Started verifying the app in Simulator — hit a stuck first-boot (data migration loop); erased and rebooted the device to recover. Install/launch of the built app is still in progress as of this entry.
- Set up (but not yet installed) a nightly local logging routine: `scripts/nightly-log.sh` + `scripts/com.aaronxu.quickbmi.nightlylog.plist`, intended to run at 10pm daily via launchd and append a dated entry here. Installing the LaunchAgent requires copying it into `~/Library/LaunchAgents` and running `launchctl load`, which needs to be done by hand (outside the project directory).

**PLAN.md status:** Day 1 essentially complete — only "Verify in Simulator" is still open (in progress). Day 2 (App Store Connect record) is blocked on Apple Developer Program approval, still pending.

**Blockers hit today (all resolved except the last):**
- `sudo xcodebuild -license` required before git/dev tools would run at all.
- Xcode's simulator support wasn't wired up (`xcode-select` pointed at Command Line Tools) — fixed with `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer`.
- `sudo xcodebuild -runFirstLaunch` needed for Xcode's first-launch components.
- No iOS Simulator runtime installed — had to download iOS 26.5 (8.5 GB).
- Simulator device got stuck mid-first-boot; erase + reboot fixed it. Install/launch verification still pending as of this log entry.

**Next:**
- Finish verifying QuickBMI actually runs in Simulator (both unit systems, edge inputs, light/dark mode).
- Install the nightly logging LaunchAgent by hand (`cp` the plist to `~/Library/LaunchAgents`, `chmod +x` the script, `launchctl load -w ...`).
- Once Apple Developer Program enrollment clears, move to Day 2 (App Store Connect record).
