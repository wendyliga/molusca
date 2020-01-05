import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TemplateContentTests.allTests),
        testCae(TemplateTests.allTests),
    ]
}
#endif
