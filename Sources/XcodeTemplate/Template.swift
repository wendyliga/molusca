/**
 Providing Xcode Template
 
 You can get what file and its content based on target type
 */
public enum Template: Int, CaseIterable {
    case uiTest = 1
    case unitTest = 2
    
    /**
     template string identifier
     */
    public var name: String {
        switch self {
        case .uiTest:
            return "UI Test"
        case .unitTest:
            return "Unit Test"
        }
    }
    
    /**
     Files that included on current target
     */
    public func contents(targetName: String, authorName: String) -> [Content] {
        switch self {
        case .uiTest:
            return [
                Content(fileName: "Info",
                     content: TemplateContent.infoPlist(),
                     extension: "plist"),
                Content(fileName: "\(targetName)UITests",
                    content: TemplateContent.unitTest(targetName: targetName, authorName: authorName),
                    extension: "swift")
            ]
        case .unitTest:
            return [
                Content(fileName: "Info",
                     content: TemplateContent.infoPlist(),
                     extension: "plist"),
                Content(fileName: "\(targetName)Tests",
                    content: TemplateContent.uiTest(targetName: targetName, authorName: authorName),
                    extension: "swift")
            ]
        }
    }
    
    public struct Content {
        public let fileName: String
        public let content: String
        public let `extension`: String
    }
}
