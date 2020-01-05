/**
 Providing Xcode Template
 
 You can get what file and its content based on target type
 */
public enum Template {
    case uiTest(targetName: String, authorName: String)
    case unitTest(targetName: String, authorName: String)
    
    /**
     template integer identifier
     */
    public var rawValue: Int {
        switch self {
        case .uiTest:
            return 0
        case .unitTest:
            return 1
        }
    }
    
    /**
     template string identifier
     */
    public var identifier: String {
        switch self {
        case .uiTest:
            return "ui-test"
        case .unitTest:
            return "unit-test"
        }
    }
    
    /**
     Files that included on current target
     */
    public var files: [File] {
        switch self {
        case let .uiTest(targetName, authorName):
            return [
                File(fileName: "Info",
                     content: TemplateContent.infoPlist(),
                     extension: "plist"),
                File(fileName: "\(targetName)UITests",
                    content: TemplateContent.unitTest(targetName: targetName, authorName: authorName),
                    extension: "swift")
            ]
        case let .unitTest(targetName, authorName):
            return [
                File(fileName: "Info",
                     content: TemplateContent.infoPlist(),
                     extension: "plist"),
                File(fileName: "\(targetName)Tests",
                    content: TemplateContent.uiTest(targetName: targetName, authorName: authorName),
                    extension: "swift")
            ]
        }
    }
    
    public struct File {
        public let fileName: String
        public let content: String
        public let `extension`: String
    }
}
