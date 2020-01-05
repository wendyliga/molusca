import XCTest

@testable import XcodeTemplate

internal final class TemplateTests: XCTestCase {
    internal func test_unitTestTemplate() {
        let unitTestTemplate = Template.unitTest
        let files = unitTestTemplate.files(targetName: "Molusca", authorName: "Wendy Liga")
        
        XCTAssert(files.contains(where: { file -> Bool in
            file.fileName == "Info" && file.extension == "plist"
        }))
        
        XCTAssert(files.contains(where: { file -> Bool in
            file.fileName == "MoluscaTests" && file.extension == "swift"
        }))
        
        XCTAssertEqual(unitTestTemplate.rawValue, 2)
        XCTAssertEqual(unitTestTemplate.name, "Unit Test")
    }
    
    internal func test_uiTestTemplate() {
        let uiTestTemplate = Template.uiTest
        let files = uiTestTemplate.files(targetName: "Molusca", authorName: "Wendy Liga")
        
        XCTAssert(files.contains(where: { file -> Bool in
            file.fileName == "Info" && file.extension == "plist"
        }))
        
        XCTAssert(files.contains(where: { file -> Bool in
            file.fileName == "MoluscaUITests" && file.extension == "swift"
        }))
        
        XCTAssertEqual(uiTestTemplate.rawValue, 1)
        XCTAssertEqual(uiTestTemplate.name, "UI Test")
    }
}
