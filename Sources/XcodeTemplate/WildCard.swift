import Explorer
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

extension File {
    public func removeWildCard(targetName: String, authorName: String, year: String = yearStringValue, today: String = todayStringValue) -> File {
        let fileNameWithoutWildcard = name.replacingOccurrences(of: WildCard.targetName.rawValue, with: targetName)
        let contentWithoutWildcard = content?.replacingOccurrences(of: WildCard.targetName.rawValue, with: targetName)
            .replacingOccurrences(of: WildCard.authorName.rawValue, with: authorName)
            .replacingOccurrences(of: WildCard.year.rawValue, with: year)
            .replacingOccurrences(of: WildCard.today.rawValue, with: today)
        
        return File(name: fileNameWithoutWildcard, content: contentWithoutWildcard, extension: self.extension, attributes: self.attributes)
    }
}

extension Folder {
    public func removeWildCard(targetName: String, authorName: String, year: String = yearStringValue, today: String = todayStringValue) -> Folder {
        let fileNameWithoutWildcard = name.replacingOccurrences(of: WildCard.targetName.rawValue, with: targetName)
        let contensWithoutWildCard = contents.map { explorable -> Explorable in
            if let file = explorable as? File {
                return file.removeWildCard(targetName: targetName, authorName: authorName, year: year, today: today)
            } else if let folder = explorable as? Folder {
                return folder.removeWildCard(targetName: targetName, authorName: authorName, year: year, today: today)
            } else {
                assertionFailure("Casting not handle")
                return explorable
            }
        }
        
        return Folder(name: fileNameWithoutWildcard, contents: contensWithoutWildCard, attributes: self.attributes)
    }
}

extension Explorable {
    public func removeWildCard(targetName: String, authorName: String, year: String = yearStringValue, today: String = todayStringValue) -> Explorable {
        if let file = self as? File {
           return file.removeWildCard(targetName: targetName, authorName: authorName, year: year, today: today)
        } else if let folder = self as? Folder {
            return folder.removeWildCard(targetName: targetName, authorName: authorName, year: year, today: today)
        } else {
            assertionFailure("Casting not handle")
            return self
        }
    }
}
