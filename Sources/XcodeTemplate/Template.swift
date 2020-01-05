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
    public func files(targetName: String, authorName: String) -> [File] {
        switch self {
        case .uiTest:
            return [
                File(fileName: "Info",
                     content: TemplateContent.infoPlist(),
                     extension: "plist"),
                File(fileName: "\(targetName)UITests",
                    content: TemplateContent.unitTest(targetName: targetName, authorName: authorName),
                    extension: "swift")
            ]
        case .unitTest:
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
