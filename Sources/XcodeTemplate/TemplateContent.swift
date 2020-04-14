import Explorer
import Foundation

public protocol TemplateContentRawValue {
    var content: Explorable { get }
}

public enum UITestTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    case dummyTest
    
    public var content: Explorable {
        switch self {
        case .infoPlist:
            return File(name: "Info", content: InfoPlist.default.rawValue, extension: "plist")
        case .dummyTest:
            return File(name: WildCard.targetName.rawValue + "UITests", content: SwiftFile.dummyUiTest.rawValue, extension: "swift")
        }
    }
}

public enum UnitTestTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    case dummyTest
    
    public var content: Explorable {
        switch self {
        case .infoPlist:
            return File(name: "Info", content: InfoPlist.default.rawValue, extension: "plist")
        case .dummyTest:
            return File(name: WildCard.targetName.rawValue + "Tests", content: SwiftFile.dummyUnitTest.rawValue, extension: "swift")
        }
    }
}

public enum SingleAppTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    case appDelegate
    case sceneDelegate
    case launchScreen
    case dummyViewController
    case assets
    
    public var content: Explorable {
        switch self {
        case .infoPlist:
            return File(name: "Info", content: InfoPlist.singleApp.rawValue, extension: "plist")
        case .appDelegate:
            return File(name: "AppDelegate", content: SwiftFile.singleAppDelegate.rawValue, extension: "swift")
        case .sceneDelegate:
            return File(name: "SceneDelegate", content: SwiftFile.singleAppSceneDelegate.rawValue, extension: "swift")
        case .launchScreen:
            return File(name: "LaunchScreen", content: launchStoryBoard, extension: "swift")
        case .dummyViewController:
            return File(name: "ViewController", content: SwiftFile.dummyViewController.rawValue, extension: "swift")
        case .assets:
            let content = File(name: "content", content: appIconContentJson, extension: "json")
            let appIcon = Folder(name: "AppIcon.appiconset", contents: [content])
            return Folder(name: "Assets.xcassets", contents: [appIcon])
        }
    }
}

public enum SingleAppIOS12TemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    case appDelegate
    case launchScreen
    case dummyViewController
    
    public var content: Explorable {
        switch self {
        case .infoPlist:
            return File(name: "Info", content: InfoPlist.singleAppIOS12.rawValue, extension: "plist")
        case .appDelegate:
            return File(name: "AppDelegate", content: SwiftFile.singleIOS12AppDelegate.rawValue, extension: "swift")
        case .launchScreen:
            return File(name: "LaunchScreen", content: launchStoryBoard, extension: "swift")
        case .dummyViewController:
            return File(name: "ViewController", content: SwiftFile.dummyViewController.rawValue, extension: "swift")
        }
    }
}

public enum BundleTemplateContent: CaseIterable, TemplateContentRawValue {
    case infoPlist
    
    public var content: Explorable {
        switch self {
        case .infoPlist:
            return File(name: "Info", content: InfoPlist.bundle.rawValue, extension: "plist")
        }
    }
}

public enum FrameworkTemplateContent: CaseIterable, TemplateContentRawValue {
    case header
    
    public var content: Explorable {
        switch self {
        case .header:
            return File(name: WildCard.targetName.rawValue, content: frameworkHeader, extension: "h")
        }
    }
}
