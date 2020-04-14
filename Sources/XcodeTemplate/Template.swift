import Explorer

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
    case singleAppIOS12 = 6
    
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
        case .singleAppIOS12:
            return "Single App(iOS 12)"
        case .bundle:
            return "Bundle"
        case .framework:
            return "Framework"
        
        }
    }
    
    /**
     Files that included on current target
     */
    public func contents(targetName: String, authorName: String, year: String = yearStringValue, today: String = todayStringValue) -> [Explorable] {
        return templateContents(type: self)
            .map { $0.content.removeWildCard(targetName: targetName, authorName: authorName, year: year, today: today) }
    }
    
    /**
     Get all basic type of files, if you want to custom it
     */
    public func templateContents(type: Self) -> [TemplateContentRawValue] {
        switch type {
        case .uiTest:
            return UITestTemplateContent.allCases
        case .unitTest:
            return UnitTestTemplateContent.allCases
        case .singleApp:
            return SingleAppTemplateContent.allCases
        case .bundle:
            return BundleTemplateContent.allCases
        case .framework:
            return FrameworkTemplateContent.allCases
        case .singleAppIOS12:
            return SingleAppIOS12TemplateContent.allCases
        }
    }
}
