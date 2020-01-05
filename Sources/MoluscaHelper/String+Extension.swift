import Foundation

extension String {
    /// return nil if string is empty
    public var nonEmpty: String? {
        guard count > 0 else {
            return nil
        }
        
        return self
    }
    
    public func withoutSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else {
            return self
        }
        
        let startIndex = index(endIndex, offsetBy: -suffix.count)
        return replacingCharacters(in: startIndex..<endIndex, with: "")
    }
}
