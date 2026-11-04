# Build an iPhone app without a Mac

[![Build iPhone app](https://github.com/Manraj10/ios-without-a-mac/actions/workflows/build.yml/badge.svg)](https://github.com/Manraj10/ios-without-a-mac/actions/workflows/build.yml)

A template that builds a real SwiftUI app on GitHub's free cloud Macs and gets it onto your own iPhone from a Windows PC. No Mac, no paid Apple account, no tool to install besides Sideloadly.

I built [NoStep](https://manraj.me), an iPhone app with about 33,000 lines of Swift, this way from a Windows laptop. This repo is that build setup with the app taken out.

## Read this first

- **You still need an iPhone** (iOS 16 or newer) and a USB cable. There's no iPhone simulator on Windows.
- **A free Apple ID gets you 7-day installs.** After 7 days the app stops opening until you install it again. Free accounts can have 3 of these apps on a phone at once.
- **The App Store and TestFlight need Apple's paid program** ($99 a year). This repo gets the app onto your own phone, not into the store.
- **Every change is a round trip.** You push, wait a few minutes for the cloud Mac, then reinstall. There are no breakpoints.

If that's fine, the whole thing costs $0.

## What you need

- A Windows PC
- An iPhone with iOS 16 or newer, and its USB cable
- A free [GitHub](https://github.com) account
- A free Apple ID (the one on your phone works, or make a second one for this)

## Steps

### 1. Make your copy

Click **Use this template**, then **Create a new repository**. Keep it **public**: GitHub's cloud Macs are free and unlimited for public repositories, and a private repository only gets about 190 Mac minutes a month (more on that [below](#private-repositories)).

### 2. Give the app a unique ID

Open `project.yml` in your new repository, click the pencil icon, and change this line to something only you would use:

```yaml
bundleIdPrefix: com.example.changeme   # for example com.yourgithubname
```

Commit the change. That push starts the first build.

### 3. Wait for the build

Open the **Actions** tab. The cloud Mac generates the Xcode project, builds the app without signing it, and puts `MyApp.ipa` on a release called **latest**. When the run turns green, download the file from:

```
https://github.com/YOUR-NAME/YOUR-REPO/releases/download/latest/MyApp.ipa
```

The tests run last, so a failing test never stops you from getting the app.

### 4. Set up your PC

1. Install **iTunes** and **iCloud** from apple.com, not from the Microsoft Store. Sideloadly can't see your phone through the Store versions, so uninstall those first if you have them.
2. Install [Sideloadly](https://sideloadly.io).

### 5. Install the app

1. Plug in your iPhone, unlock it, and tap **Trust** when it asks about the computer.
2. Open Sideloadly. Drag `MyApp.ipa` into it, type your Apple ID, and click **Start**. If Apple sends you a code, type it in.
3. Sideloadly signs the app with your Apple ID and installs it.

### 6. Allow it on the phone

1. Go to **Settings > General > VPN & Device Management**, tap your Apple ID, and tap **Trust**.
2. Go to **Settings > Privacy & Security > Developer Mode**, turn it on, and restart when asked. Confirm after the restart. The switch only shows up after you've installed an app like this once.

Open **My App**. It shows the commit it was built from, so you always know which version is on your phone.

## Making it yours

- Your Swift code goes in `App/`. Tests go in `Tests/`.
- The name under the icon is `CFBundleDisplayName` in `project.yml`. Edit `project.yml` instead of an Xcode project file, since the cloud Mac generates the project from it on every build.
- To ship a change: push it, wait for the green run, download `MyApp.ipa` again, and drag it into Sideloadly.
- Every 7 days, install it again the same way. Sideloadly can also refresh it for you in the background; see its site.

## Limits of a free Apple ID

| | Free Apple ID | Apple Developer Program ($99/yr) |
|---|---|---|
| Install on your own iPhone | Yes, 7 days at a time | Yes, a year at a time |
| Apps per phone | 3 | No limit |
| New app IDs | 10 | No limit |
| Push notifications, iCloud and similar | No | Yes |
| TestFlight and the App Store | No | Yes |

Apple's [membership comparison](https://developer.apple.com/support/compare-memberships/) has the details. Apple waives the $99 for some nonprofits and schools, but not for individual students.

## Private repositories

Mac minutes on a private repository come out of GitHub's free monthly allowance, which buys roughly 190 Mac minutes. A build of this template takes a few minutes, but a bigger app with UI tests can burn through that in two runs. Keep the repository public, or use [Codemagic](https://codemagic.io/pricing/), which gives personal accounts 500 free Mac minutes a month.

## Other ways to do this

| | Pick it if |
|---|---|
| **This template** | You want a plain SwiftUI project and to see every step, with nothing to install but Sideloadly. |
| [xtool](https://github.com/xtool-org/xtool) | You want to build on your own PC with no cloud Mac. On Windows it runs through WSL with USB passthrough and needs a manual Xcode download. |
| [ios-builder](https://github.com/MobAI-App/ios-builder) | You want a CLI that sets up the cloud build for you. It installs through the MobAI app. |
| [AltStore](https://altstore.io) or [SideStore](https://sidestore.io) | You'd rather use them than Sideloadly. SideStore can refresh the 7-day install from the phone itself. |
| Flutter, React Native or Expo | You don't need Swift and want Android from the same code. |

## When something goes wrong

| What you see | What to do |
|---|---|
| The build fails at "Generate the Xcode project" | `project.yml` is indented with spaces only. Check the line you edited. |
| The build fails at "Publish to the latest release" with "Resource not accessible" | Go to **Settings > Actions > General > Workflow permissions** and choose **Read and write permissions**, then re-run the build. |
| The build fails right away with `runs-on: macos-26` in the log | GitHub retired that cloud Mac. Change it to the newest label listed in [actions/runner-images](https://github.com/actions/runner-images). |
| Sideloadly says the App ID is not available | Someone already uses that ID. Change `bundleIdPrefix` in `project.yml` again and rebuild. |
| Sideloadly doesn't see your iPhone | Use iTunes from apple.com, not the Microsoft Store. Unlock the phone and tap **Trust**. |
| The app says "Untrusted Developer" | Trust your Apple ID in **Settings > General > VPN & Device Management**. |
| You can't find Developer Mode | Install the app once first. The switch appears after that. |
| Sideloadly says you've hit the app limit | A free Apple ID allows 3 of these apps per phone. Delete one. |
| The app stopped opening | The 7 days ran out. Install it again. |

## License

MIT. Use it for anything.
