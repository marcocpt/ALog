import XCTest
@testable import ALog

final class ALogTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let log = ALog(.error)
        log.debug("test")
        log.error("error")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
