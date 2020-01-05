import XCTest

@testable import MoluscaHelper

internal final class StringTests: XCTestCase {
    internal static var allTests = [
        ("test_nonEmpty_withNonEmptyString", test_nonEmpty_withNonEmptyString),
        ("test_nonEmpty_withEmptyString", test_nonEmpty_withEmptyString),
        ("test_nonEmpty_withNilString", test_nonEmpty_withNilString),
        ("test_withPrefixIdentation_withValidIdentation", test_withPrefixIdentation_withValidIdentation),
        ("test_withPrefixIdentation_withNonValidIdentation", test_withPrefixIdentation_withNonValidIdentation),
        ("test_separate", test_separate),
        ("test_string_nonEmptyArray", test_string_nonEmptyArray),
        ("test_string_emptyArray", test_string_emptyArray),
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
    
    internal func test_withPrefixIdentation_withValidIdentation() {
        let string = "Hello World"
        
        XCTAssertEqual(string.withPrefixIdentation(count: 1), "    Hello World")
    }
    
    internal func test_withPrefixIdentation_withNonValidIdentation() {
        let string = "Hello World"
        
        XCTAssertEqual(string.withPrefixIdentation(count: -1), "Hello World")
    }
    
    internal func test_separate() {
        let string = "Hello"
        
        XCTAssertEqual(string.separate(with: "World", offset: 6), "Hello World")
    }
    
    internal func test_string_nonEmptyArray() {
        let array = ["Apple", "Banana", "Orange"]
        
        XCTAssertEqual(array.stringValue(), "Apple, Banana, Orange")
    }
    
    internal func test_string_emptyArray() {
        let array: [String] = []
        
        XCTAssertEqual(array.stringValue(), "")
    }
}
