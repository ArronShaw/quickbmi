# QuickBMI — Ship Plan

Goal: validate the full path from zero to a live App Store app. The app is deliberately trivial (see [CONTEXT.md](./CONTEXT.md)); the pipeline is the point.

Two tracks run in parallel: **things we control** (build, assets, metadata) and **Apple's queues** (developer enrollment, App Store review) which we can't speed up. Plan the controllable track so it's never the bottleneck.

## Status

- [ ] Apple Developer Program enrollment — **submitted, awaiting approval** (external, blocking for App Store Connect/TestFlight)

## Day 1 — Local build, no Apple dependency

Everything today works whether or not enrollment has cleared yet.

- [ ] Install full Xcode from the Mac App Store (only Command Line Tools present currently — budget 30-60+ min for the download)
- [ ] `git init` this repo, create a GitHub repo, push
- [ ] Scaffold a new SwiftUI iOS App project, bundle ID `com.aaronxu.quickbmi`, iPhone only (deployment target: latest stable iOS)
- [ ] Implement the calculator: height/weight input, unit toggle (imperial lb/ft-in default ↔ metric kg/cm), Calculate button, BMI result + category display (Underweight/Normal/Overweight/Obese)
- [ ] Generate a simple app icon (all required sizes) and add to the asset catalog
- [ ] Write and publish the privacy policy + support page to GitHub Pages (no data collection, so this is a short page)
- [ ] Verify the app in Simulator: both unit systems, edge inputs (0, very large values), light + dark mode

## Day 2 — App Store Connect record (once enrollment clears)

- [ ] Confirm Apple Developer Program approval email
- [ ] Create the app record in App Store Connect: name **QuickBMI**, bundle ID `com.aaronxu.quickbmi`, category Health & Fitness, age rating 4+, price Free
- [ ] Fill in privacy policy URL + support URL (from the GitHub Pages site)
- [ ] Sanity-check code signing: development team selected in Xcode, automatic signing enabled

If enrollment is still pending at end of Day 1, this day shifts wholesale — nothing here can start without it.

## Day 3 — TestFlight

- [ ] Archive the build in Xcode (Product → Archive)
- [ ] Upload to App Store Connect via Xcode Organizer
- [ ] Wait for TestFlight processing (Apple-side, typically minutes, occasionally longer for first-time export-compliance checks)
- [ ] Answer export compliance question: **No** (no encryption beyond standard iOS APIs)
- [ ] Install the build via the TestFlight app on your physical iPhone
- [ ] Verify on-device: calculator works, icon renders correctly, no crashes

## Day 4 — Submission

- [ ] Fill out App Store listing metadata: description, keywords, promotional text
- [ ] Capture required screenshots (iPhone 6.7" display size) from Simulator or device
- [ ] Attach the TestFlight-verified build to the App Store Connect version
- [ ] Support email: aaronxuwp@gmail.com (confirm or swap before submitting)
- [ ] Submit for App Store Review

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
