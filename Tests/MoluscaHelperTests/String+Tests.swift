import XCTest

@testable import MoluscaHelper

internal final class StringTests: XCTestCase {
    internal static var allTests = [
        ("test_nonEmpty_withNonEmptyString", test_nonEmpty_withNonEmptyString),
        ("test_nonEmpty_withEmptyString", test_nonEmpty_withEmptyString),
        ("test_nonEmpty_withNilString", test_nonEmpty_withNilString),
        ("test_withoutSuffix_withValidString", test_withoutSuffix_withValidString),
        ("test_withoutSuffix_withNonValidParameter", test_withoutSuffix_withNonValidParameter),
        ("test_withoutSuffix_withEmptyString", test_withoutSuffix_withEmptyString),
    ]
    
    internal func test_nonEmpty_withNonEmptyString() {
        let string = "Hello World"
        
        XCTAssertEqual(string.nonEmpty, "Hello World")
    }
    
    internal func test_nonEmpty_withEmptyString() {
        let string = ""
        
        XCTAssertEqual(string.nonEmpty, nil)
    }
    
    internal func test_nonEmpty_withNilString() {
        let string: String? = nil
        
        XCTAssertEqual(string?.nonEmpty, nil)
    }
    
    internal func test_withoutSuffix_withValidString() {
        let string = "Hello World"
        
        XCTAssertEqual(string.withoutSuffix("World"), "Hello ")
    }
    
    internal func test_withoutSuffix_withNonValidParameter() {
        let string = "Hello World"
        
        XCTAssertEqual(string.withoutSuffix("Molusca"), "Hello World")
    }
    
    internal func test_withoutSuffix_withEmptyString() {
        let string = ""
        
        XCTAssertEqual(string.withoutSuffix("World"), "")
    }
}
