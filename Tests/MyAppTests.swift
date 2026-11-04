import XCTest
@testable import MyApp

// Runs on an iPhone simulator on the cloud Mac. Add your own tests next to this one.
final class MyAppTests: XCTestCase {
    func testTapLabel() {
        XCTAssertEqual(tapLabel(0), "Tap me")
        XCTAssertEqual(tapLabel(1), "Tapped 1 time")
        XCTAssertEqual(tapLabel(2), "Tapped 2 times")
    }
}
