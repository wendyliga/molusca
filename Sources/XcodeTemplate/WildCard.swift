import Foundation

/**
 Singleton of DateFormatter, so task that utilize Date Formatting will not recreate `DateFormatter` instance which known have really huge performance usage.
 */
private let dateFormatter = DateFormatter()

/**
 Get Today value in string

 Example: 31/12/2020
 */
public var todayStringValue: String {
    dateFormatter.dateFormat = "dd/MM/yy"

    return dateFormatter.string(from: Date())
}

/**
 Get Year value in String

 Example: 2020
 */
public var yearStringValue: String{
    dateFormatter.dateFormat = "yyyy"

    return dateFormatter.string(from: Date())
}

public enum WildCard: String, CaseIterable {
    case targetName = "%%TARGET_NAME%%"
    case authorName = "%%AUTHOR_NAME%%"
    case year = "%%YEAR%%"
    case today = "%%TODAY%%"
}

extension TemplateContent {
    public func removeWildCard(targetName: String, authorName: String, year: String = yearStringValue, today: String = todayStringValue) -> TemplateContent {
        let NoWildCardFileName = fileName.replacingOccurrences(of: WildCard.targetName.rawValue, with: targetName)
        
        let noWildCardContent = content
            .replacingOccurrences(of: WildCard.targetName.rawValue, with: targetName)
            .replacingOccurrences(of: WildCard.authorName.rawValue, with: authorName)
            .replacingOccurrences(of: WildCard.year.rawValue, with: year)
            .replacingOccurrences(of: WildCard.today.rawValue, with: today)

        return TemplateContent(fileName: NoWildCardFileName, content: noWildCardContent, extension: `extension`)
    }
}
