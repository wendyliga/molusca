import XCTest

@testable import SwiftKit

internal final class StringTests: XCTestCase {
    internal static var allTests = [
        ("test_withPrefixIdentation_withValidIdentation", test_withPrefixIdentation_withValidIdentation),
        ("test_withPrefixIdentation_withNonValidIdentation", test_withPrefixIdentation_withNonValidIdentation),
        ("test_separate", test_separate),
        ("test_string_nonEmptyArray", test_string_nonEmptyArray),
        ("test_string_emptyArray", test_string_emptyArray),
    ]
    
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
