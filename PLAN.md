# QuickBMI — Ship Plan

Goal: validate the full path from zero to a live App Store app. The app is deliberately trivial (see [CONTEXT.md](./CONTEXT.md)); the pipeline is the point.

Two tracks run in parallel: **things we control** (build, assets, metadata) and **Apple's queues** (developer enrollment, App Store review) which we can't speed up. Plan the controllable track so it's never the bottleneck.

## Status

- [x] Apple Developer Program enrollment — **approved**

## Day 1 — Local build, no Apple dependency

Everything today works whether or not enrollment has cleared yet.

- [x] Install full Xcode from the Mac App Store (only Command Line Tools present currently — budget 30-60+ min for the download)
- [x] `git init` this repo, create a GitHub repo, push
- [x] Scaffold a new SwiftUI iOS App project, bundle ID `com.aaronxu.quickbmi`, iPhone only (deployment target: latest stable iOS)
- [x] Implement the calculator: height/weight input, unit toggle (imperial lb/ft-in default ↔ metric kg/cm), Calculate button, BMI result + category display (Underweight/Normal/Overweight/Obese)
- [x] Generate a simple app icon (all required sizes) and add to the asset catalog
- [x] Write and publish the privacy policy + support page to GitHub Pages (no data collection, so this is a short page)
- [x] Verify the app on physical iPhone via Xcode (Simulator not viable on this Mac's current resources): both unit systems, edge inputs (0, very large values), light + dark mode

## Day 2 — App Store Connect record (once enrollment clears)

- [ ] Confirm Apple Developer Program approval email
- [x] Create the app record in App Store Connect: name **QuickBMI**, bundle ID `com.aaronxu.quickbmi`, category Health & Fitness, age rating 4+, price Free
- [x] Fill in privacy policy URL + support URL (from the GitHub Pages site)
- [x] Sanity-check code signing: development team selected in Xcode, automatic signing enabled (confirmed: `DEVELOPMENT_TEAM = FC9W3726FF`, `CODE_SIGN_STYLE = Automatic`)

If enrollment is still pending at end of Day 1, this day shifts wholesale — nothing here can start without it.

## Day 3 — TestFlight

- [x] Archive the build in Xcode (Product → Archive)
- [x] Upload to App Store Connect via Xcode Organizer
- [x] Wait for TestFlight processing (Apple-side, typically minutes, occasionally longer for first-time export-compliance checks)
- [x] Answer export compliance question: **No** (no encryption beyond standard iOS APIs)
- [x] Install the build via the TestFlight app on your physical iPhone
- [x] Verify on-device: calculator works, icon renders correctly, no crashes

## Day 4 — Submission

- [x] Fill out App Store listing metadata: description, keywords, promotional text
- [x] Capture required screenshots (iPhone 6.7" display size) from Simulator or device (captured on physical iPhone 17, resized to 1242×2688)
- [x] Attach the TestFlight-verified build to the App Store Connect version
- [x] Support email: aaronxuwp@gmail.com (confirmed)
- [x] Submit for App Store Review

## Day 5+ — Review and publish

- [ ] Apple App Store review (historically ~1-3 days, can run longer — outside our control)
- [ ] If rejected: read the rejection reason, fix, resubmit (loops back into Day 4)
- [ ] Once approved: release (manual or automatic release, your choice in App Store Connect)
- [ ] **Pipeline validated** — confirm the app is live and searchable on the App Store

## Open defaults (flagged, not silently assumed)

- Age rating: 4+
- Export compliance: No encryption
- Support email: aaronxuwp@gmail.com

Change any of these by editing this file or telling me directly.
