import SwiftUI

struct ContentView: View {
    @State private var taps = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Built without a Mac")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
            Button(tapLabel(taps)) { taps += 1 }
                .buttonStyle(.borderedProminent)
            Text("commit \(commit)")
                .font(.footnote.monospaced())
                .foregroundStyle(.secondary)
        }
        .padding()
    }

    // The cloud Mac writes the commit into Info.plist, so you can tell which push is on your phone.
    private var commit: String {
        Bundle.main.object(forInfoDictionaryKey: "GitCommit") as? String ?? "unknown"
    }
}

func tapLabel(_ taps: Int) -> String {
    switch taps {
    case 0: return "Tap me"
    case 1: return "Tapped 1 time"
    default: return "Tapped \(taps) times"
    }
}
