import XCTest
@testable import IamAIChat

final class IamAIChatTests: XCTestCase {
    func testEchoGenerator() {
        let prompt = "Hello"
        let ptr = iamai_generate(prompt)
        let result = String(cString: ptr!)
        XCTAssertEqual(result, prompt)
        iamai_free(UnsafeMutablePointer(mutating: ptr))
    }
}
