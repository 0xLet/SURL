import XCTest
@testable import SURL

final class SURLTests: XCTestCase {
    func testStringURLInit() {
        XCTAssertEqual(
            URL(string: "https://something.com:8080")?.host,
            "https://something.com:8080".url?.host
        )
    }
    
    static var allTests = [
        ("testStringURLInit", testStringURLInit),
    ]
}
