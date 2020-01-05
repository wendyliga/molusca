import Foundation

extension FileManager {
    public func isFolder(atPath path: String) -> Bool {
        var objCBool: ObjCBool = false
        
        guard fileExists(atPath: path, isDirectory: &objCBool) else {
            return false
        }
        
        return objCBool.boolValue
    }
}
