import Foundation

public protocol FileProvider {
    func fileExists(atPath: String) -> Bool
    func removeItem(atPath: String) throws
    func createFile(atPath: String, contents: Data?, attributes: [FileAttributeKey : Any]?) -> Bool
}

public class DefaultFileProvider: FileProvider {
    private let fileManager = FileManager.default
    
    public init() {}
    
    public func fileExists(atPath: String) -> Bool {
        return fileManager.fileExists(atPath: atPath)
    }
    
    public func removeItem(atPath: String) throws {
        return try fileManager.removeItem(atPath: atPath)
    }
    
    public func createFile(atPath: String, contents: Data?, attributes: [FileAttributeKey : Any]? = nil) -> Bool {
        return fileManager.createFile(atPath: atPath, contents: contents, attributes: attributes)
    }
}
