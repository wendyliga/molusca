/**
 Providing Xcode Template
 
 You can get what file and its content based on target type
 */
public enum Template: Int, CaseIterable {
    case uiTest = 1
    case unitTest = 2
    case singleApp = 3
    case bundle = 4
    case framework = 5
    
    /**
     template string identifier
     */
    public var name: String {
        switch self {
        case .uiTest:
            return "UI Test"
        case .unitTest:
            return "Unit Test"
        case .singleApp:
            return "Single App"
        case .bundle:
            return "Bundle"
        case .framework:
            return "Framework"
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
        
        case .singleApp:
            return  [
                Content(fileName: "Info", content: TemplateContent.infoPlist(), extension: "plist"),
                Content(fileName: "AppDelegate", content: TemplateContent.appDelegate(targetName: targetName, authorName: authorName),
                extension: "swift"),
                Content(fileName: "SceneDelegate", content: TemplateContent.sceneDelegate(targetName: targetName, authorName: authorName),
                extension: "swift"),
                Content(fileName: "LaunchScreen", content: TemplateContent.launchStoryBoard(), extension: "storyboard"),
                Content(fileName: "ViewController", content: TemplateContent.viewController(targetName: targetName, authorName: authorName), extension: "swift"),
                
            ]
        case .bundle:
            return [Content(fileName: "Info", content: TemplateContent.bundleInfoPlist(authorName: authorName), extension: "plist")]
        case .framework:
            return [
                Content(fileName: targetName, content: TemplateContent.frameworkHeader(targetName: targetName, authorName: authorName), extension: "h"),
                Content(fileName: "Info", content: TemplateContent.infoPlist(), extension: "plist")
            ]
        }
    }
    
    public struct Content {
        public let fileName: String
        public let content: String
        public let `extension`: String
    }
}
