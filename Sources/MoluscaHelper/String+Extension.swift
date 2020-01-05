import Foundation

extension String {
    /**
     String that's not empty will be true
     */
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    /**
     Add identation in front of string
     
     Example
     ```
     let name = "Wendy Liga"
     let nameWithIdentation = "Wendy Liga".withPrefixIdentation()
     
     print(nameWithIdentation) -> "    Wendy Liga"
     ```
     - Parameters:
        - count: number of identation
     
     - Returns: String with prefix Identation
     */
    public func withPrefixIdentation(count: Int = 1) -> String {
        guard count > 0 else {
            return self
        }
        
        let defaultIdentation = "    "
        
        return (0..<count)
            .map { [defaultIdentation] _ in defaultIdentation}
            .joined() + self
    }
    
    /**
     Separate two text with spesific offset
     
     This function will create table like string
     
     Example:
     ```
     String         an collection of characters
     Int            containing number
     Double         bigger than Int
     ```
     
     - Parameters:
          - with: right side text
          - offset: how many offset from left side
     
     - Returns: String with separation, look Example for mode detail
     */
    public func separate(with rightSide: String, offset: Int) -> String {
        let debtCount = offset - self.count
        
        guard debtCount > 0 else {
            return self + " " + rightSide
        }
        
        let fillerSpace = (0..<debtCount).map{_ in " "}.joined()
        
        return self + fillerSpace  + rightSide
    }
    
    /**
     remote white space inside `String`
     */
    public func removeWhiteSpace() -> String{
        return self.replacingOccurrences(of: " ", with: "")
    }
}

extension Array where Element == String {
    /**
     Get String value from array of String
     
     Example:
     ```
        let array = ["Apple", "Banana", "Orange"]
     
        array.getFormattedValue() -> Apple, Banana, Orange
     ```
     
     Returns: String value with comma separated
     */
    public func stringValue() -> String {
        var result = ""
        
        enumerated().forEach { (index,element) in
            if index == startIndex {
                result += element
                
                return
            }
            
            result += ", " + element
        }
        
        return result
    }
}
