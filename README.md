# Build an iPhone app without a Mac

[![Build iPhone app](https://github.com/Manraj10/ios-without-a-mac/actions/workflows/build.yml/badge.svg)](https://github.com/Manraj10/ios-without-a-mac/actions/workflows/build.yml)

A template that builds a real SwiftUI app on GitHub's free cloud Macs and gets it onto your own iPhone from a Windows PC. No Mac, no paid Apple account, nothing to install on your PC besides Sideloadly and Apple's iTunes and iCloud.

I built [NoStep](https://manraj.me), an iPhone app with about 33,000 lines of Swift, this way from a Windows laptop. This repo is that build setup with the app taken out.

## Read this first

- **You still need an iPhone** (iOS 16 or newer) and a USB cable that carries data. There's no iPhone simulator on Windows.
- **A free Apple ID gets you 7-day installs.** After 7 days the app stops opening until you install it again. Free accounts can have 3 of these apps on a phone at once.
- **The App Store and TestFlight need Apple's paid program** ($99 a year). This repo gets the app onto your own phone, not into the store.
- **Every change is a round trip.** You commit, wait a few minutes for the cloud Mac, then reinstall. There are no breakpoints.

If that's fine, the whole thing costs $0.

## What you need

- A Windows PC
- An iPhone with iOS 16 or newer, and its USB cable
- A free [GitHub](https://github.com) account
- A free Apple ID. The one on your phone works, or make a second one for this if you'd rather not type your main one into Sideloadly.

## Steps

### 1. Make your copy

Click **Use this template** at the top of this page, then **Create a new repository**. Give it any name and keep it **public**: GitHub's cloud Macs are free and unlimited for public repositories, while a private one only gets about 190 Mac minutes a month (see [below](#private-repositories)).

### 2. Give the app a unique ID

1. In your new repository, open `project.yml` and click the pencil icon (**Edit this file**).
2. Near the top, change `com.example.changeme` to something only you would use, like `com.yourgithubname`. Use lowercase letters, numbers, dots and hyphens only.
3. Click **Commit changes**, leave **Commit directly to the main branch** selected, and click **Commit changes** again.

That commit starts the first build.

### 3. Get the app file

1. Open the **Actions** tab and click the newest run. A yellow dot means it's still building. The first build takes a few minutes.
2. The file is ready once the **Publish to the "latest" release** step has a green check. The tests run after that, so the file is ready even if they're still running or fail.
3. Go back to the **Code** tab. Under **Releases** on the right, open **Latest build** and click **MyApp.ipa** under Assets. Don't pick "Source code". If your browser asks whether to keep the file, keep it.

From then on the file is always at the same link:

```
https://github.com/YOUR-NAME/YOUR-REPO/releases/download/latest/MyApp.ipa
```

If the Actions tab shows no run, click **Build iPhone app** on the left, then **Run workflow**.

### 4. Set up your PC

1. Download [Sideloadly](https://sideloadly.io). Its download page also links the iTunes and iCloud installers it needs.
2. Sideloadly needs the versions of iTunes and iCloud from Apple's site, not the Microsoft Store ones. If you already have the Store versions, uninstall them in **Settings > Apps > Installed apps** first.
3. Install iTunes and iCloud from those links, then install Sideloadly.

### 5. Install the app

1. Plug in your iPhone, unlock it, and tap **Trust** when it asks about the computer. Keep it unlocked until the install finishes.
2. Open Sideloadly and wait for your iPhone to show up in the device list.
3. Drag `MyApp.ipa` into the window, type your Apple ID, and click **Start**. It asks for your Apple ID password, and if Apple sends a code to your iPhone, type that in too.
4. Sideloadly signs the app with your Apple ID and installs it. It says **Done** when it's finished, usually within a minute or two.

### 6. Allow it on the phone

1. Go to **Settings > General > VPN & Device Management**, tap your Apple ID, and tap **Trust**.
2. Go to **Settings > Privacy & Security > Developer Mode**, turn it on, and restart when asked. After the restart, tap **Turn On** and enter your passcode. The switch only shows up after you've installed an app like this once.

Open **My App**. The bottom line shows the commit it was built from, so you always know which version is on your phone.

## Making it yours

Try one change from the browser:

1. Open `App/ContentView.swift`, click the pencil icon, and change `"Built without a Mac"` to anything you like.
2. Commit it to the main branch the same way as step 2.
3. When the new build is published, download `MyApp.ipa` again and drag it into Sideloadly. It replaces the old version.
4. Open the app. Your text is there, and the commit at the bottom has changed.

After that:

- Your Swift code goes in `App/` and tests go in `Tests/`. Clone the repository and use any editor if you'd rather not work in the browser.
- The name under the icon is `CFBundleDisplayName` in `project.yml`. Change settings in `project.yml`, not in an Xcode project: the cloud Mac generates the project from it on every build.
- Every 7 days, install it again the same way. Sideloadly can also refresh it for you in the background; its site explains how.
- The build badge at the top of this README shows the original repository's builds. Change it to your own name and repo, or delete it.

## Free Apple ID or paid program

| | Free Apple ID | Apple Developer Program ($99/yr) |
|---|---|---|
| Install on your own iPhone | Yes, 7 days at a time | Yes, a year at a time |
| Apps like this per phone | 3 | No 3-app limit |
| Push notifications, iCloud and similar [capabilities](https://developer.apple.com/help/account/reference/supported-capabilities-ios) | No | Yes |
| TestFlight and the App Store | No | Yes |

Apple's [membership comparison](https://developer.apple.com/support/compare-memberships/) lists the free limits: 10 app IDs, 3 devices, 3 apps per device, 7 days. Apple waives the $99 for some nonprofits, schools and government agencies, but not for individual students.

## Private repositories

Mac minutes on a private repository come out of GitHub's free monthly allowance, which buys roughly 190 Mac minutes. A build of this template takes a few minutes, but a bigger app with UI tests can use that up in two runs. Keep the repository public, or use [Codemagic](https://codemagic.io/pricing/), which gives personal accounts 500 free Mac minutes a month.

## Other ways to do this

| | Pick it if |
|---|---|
| **This template** | You want a plain SwiftUI project and to see every step, with no build tool to install. |
| [xtool](https://github.com/xtool-org/xtool) | You want to build on your own PC with no cloud Mac. On Windows it runs through WSL and takes more setup. |
| [ios-builder](https://github.com/MobAI-App/ios-builder) | You want a CLI that sets up the cloud build for you. On a free Apple ID it installs through the MobAI app. |
| [AltStore](https://altstore.io) or [SideStore](https://sidestore.io) | You'd rather use them than Sideloadly. After a one-time setup from a computer, SideStore can refresh the 7-day install from the phone itself. |
| Flutter, React Native or Expo | You don't need Swift and want Android from the same code. |

## When something goes wrong

| What you see | What to do |
|---|---|
| No run in the Actions tab | Click **Build iPhone app** on the left, then **Run workflow**. |
| The build fails at "Generate the Xcode project" | `project.yml` is indented with spaces only. Check the line you edited. |
| The build fails at "Publish to the latest release" with "Resource not accessible" | An organization is limiting workflow permissions. Make the repository under your personal account instead, or ask the organization's owner to allow read and write. |
| The build fails right away, mentioning `macos-26` | GitHub retired that cloud Mac. In `.github/workflows/build.yml`, change it to the newest label listed in [actions/runner-images](https://github.com/actions/runner-images). |
| Sideloadly says the App ID is not available | Someone already uses that ID. Change `bundleIdPrefix` in `project.yml` again and rebuild. |
| Sideloadly doesn't see your iPhone | Use iTunes from Apple's site, not the Microsoft Store. Try another cable, unlock the phone and tap **Trust**. |
| The app says "Untrusted Developer" | Trust your Apple ID in **Settings > General > VPN & Device Management**. |
| You can't find Developer Mode | Install the app once first. The switch appears after that. |
| Sideloadly says you've hit the app limit | A free Apple ID allows 3 of these apps per phone. Delete one. |
| The app stopped opening | The 7 days ran out. Install it again. |

## License

MIT. Use it for anything.
