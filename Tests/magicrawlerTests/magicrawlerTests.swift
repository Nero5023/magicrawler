import XCTest
@testable import magicrawler

class magicrawlerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(magicrawler().text, "Hello, World!")
    }


    static var allTests : [(String, (magicrawlerTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
