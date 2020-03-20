import Foundation

protocol TemplateContentRawValue {
    var content: TemplateContent { get }
}

public struct TemplateContent: Equatable {
    public let fileName: String
    public let content: String
    public let `extension`: String
}

public enum UITestTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    case dummyTest
    
    public var content: TemplateContent {
        switch self {
        case .infoPlist:
            return TemplateContent(fileName: "Info", content: InfoPlist.default.rawValue, extension: "plist")
        case .dummyTest:
            return TemplateContent(fileName: WildCard.targetName.rawValue + "UITests", content: SwiftFile.dummyUiTest.rawValue, extension: "swift")
        }
    }
}

public enum UnitTestTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    case dummyTest
    
    public var content: TemplateContent {
        switch self {
        case .infoPlist:
            return TemplateContent(fileName: "Info", content: InfoPlist.default.rawValue, extension: "plist")
        case .dummyTest:
            return TemplateContent(fileName: WildCard.targetName.rawValue + "Tests", content: SwiftFile.dummyUnitTest.rawValue, extension: "swift")
        }
    }
}

public enum SingleAppTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    case appDelegate
    case sceneDelegate
    case launchScreen
    case dummyViewController
    
    public var content: TemplateContent {
        switch self {
        case .infoPlist:
            return TemplateContent(fileName: "Info", content: InfoPlist.singleApp.rawValue, extension: "plist")
        case .appDelegate:
            return TemplateContent(fileName: "AppDelegate", content: SwiftFile.singleAppDelegate.rawValue, extension: "swift")
        case .sceneDelegate:
            return TemplateContent(fileName: "SceneDelegate", content: SwiftFile.singleAppSceneDelegate.rawValue, extension: "swift")
        case .launchScreen:
            return TemplateContent(fileName: "LaunchScreen", content: launchStoryBoard, extension: "swift")
        case .dummyViewController:
            return TemplateContent(fileName: "ViewController", content: SwiftFile.dummyViewController.rawValue, extension: "swift")
        }
    }
}

public enum BundleTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    
    public var content: TemplateContent {
        switch self {
        case .infoPlist:
            return TemplateContent(fileName: "Info", content: InfoPlist.bundle.rawValue, extension: "plist")
        }
    }
}

public enum FrameworkTemplateContent: CaseIterable, TemplateContentRawValue {
    case header
    
    public var content: TemplateContent {
        switch self {
        case .header:
            return TemplateContent(fileName: WildCard.targetName.rawValue, content: frameworkHeader, extension: "h")
        }
    }
}
