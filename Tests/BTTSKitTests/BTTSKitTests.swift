import XCTest
@testable import BTTSKit

final class BTTSKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BTTSKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
