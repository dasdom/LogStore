import XCTest
@testable import LogStore

final class LogStoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LogStore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
