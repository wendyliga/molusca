import XCTest

@testable import XcodeTemplate

internal final class TemplateTests: XCTestCase {
    internal func test_unitTestTemplate() {
        let unitTestTemplate = Template.unitTest(targetName: "Molusca", authorName: "Wendy Liga")
        
        XCTAssert(unitTestTemplate.files.contains(where: { file -> Bool in
            file.fileName == "Info" && file.extension == "plist"
        }))
        
        XCTAssert(unitTestTemplate.files.contains(where: { file -> Bool in
            file.fileName == "MoluscaTests" && file.extension == "swift"
        }))
        
        XCTAssertEqual(unitTestTemplate.rawValue, 1)
        XCTAssertEqual(unitTestTemplate.identifier, "unit-test")
    }
    
    internal func test_uiTestTemplate() {
        let uiTestTemplate = Template.uiTest(targetName: "Molusca", authorName: "Wendy Liga")
        
        XCTAssert(uiTestTemplate.files.contains(where: { file -> Bool in
            file.fileName == "Info" && file.extension == "plist"
        }))
        
        XCTAssert(uiTestTemplate.files.contains(where: { file -> Bool in
            file.fileName == "MoluscaUITests" && file.extension == "swift"
        }))
        
        XCTAssertEqual(uiTestTemplate.rawValue, 0)
        XCTAssertEqual(uiTestTemplate.identifier, "ui-test")
    }
}
