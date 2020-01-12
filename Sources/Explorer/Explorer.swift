import Foundation
import SwiftKit

public class Explorer {
    /**
     File manager instance that will used for `Explorer` Operation
     */
    private let fileManager: FileProvider
    
    /**
     Singleton of `Explorer` Class
     */
    public static let `default` = Explorer()
    
    public init(with fileManager: FileProvider = DefaultFileProvider()) {
        self.fileManager = fileManager
    }
}

extension Explorer {
    /**
     Delete File
     
     - Parameter operation: Delete operation, will delete spesific file at spesific path with `SingleFileOperation`
     
     - Returns: Result `Result<SingleFileOperation, Error>` of the operation.
     */
    @discardableResult
    public func delete(operation: SingleFileOperation) -> Result<SingleFileOperation, Error> {
        let target = operation.path + "/" + operation.file.name
        
        do {
            try fileManager.removeItem(atPath: target)
            
            return .success(operation)
        } catch let error {
            return .failure(error)
        }
    }
}
    
extension Explorer {
    /**
     Write file
     
     - Parameters:
        - operation: Write Operation, will write spesific to the operation
        - writingStrategy: how you want the operation to write based on spesific strategy
     
     - Returns: Result `Result<SingleFileOperation, Error>` of the operation.
     */
    @discardableResult
    public func write(operation: SingleFileOperation, writingStrategy: WriteStrategy = .safe) -> Result<SingleFileOperation, Error> {
        guard operation.path.isNotEmpty else {
            return .failure(FileError.pathDidNotExist(path: operation.path))
        }
        
        guard operation.file.name.isNotEmpty else {
            return .failure(FileError.fileNotValid(file: operation.file.name))
        }
        
        let target = operation.path + "/" + operation.file.name
        
        if writingStrategy == .safe && fileManager.fileExists(atPath: target) == true {
            return .failure(FileError.fileExist(file: target))
        }
        
        if writingStrategy == .skippable && fileManager.fileExists(atPath: target) == true {
            return .success(operation)
        }
        
        // default create file will overwrite the target
        guard fileManager.createFile(atPath: target, contents: operation.file.content?.data(using: .utf8), attributes: nil) else {
            return .failure(FileError.writeError(file: target))
        }
        
        return .success(operation)
    }
    
    /**
    Write files
    
    - Parameters:
       - operation: Write Operation, will write spesific to the operation
       - writingStrategy: how you want the operation to write based on spesific strategy
    
    - Returns: Result `Result<SingleFileOperation, Error>` of the operation.
    */
    @discardableResult
    public func write(operation: BatchFileOperation, writingStrategy: WriteStrategy = .safe) -> Result<BatchFileOperation, Error> {
        guard operation.path.isNotEmpty else {
            return .failure(FileError.pathDidNotExist(path: operation.path))
        }
        
        let results = operation.files.map {
            write(operation: SingleFileOperation(file: $0, path: operation.path), writingStrategy: writingStrategy)
        }
        
        let writeFailureResults = results.compactMap{ $0.nonSuccessResult }
        
        // revert if failed
        if writeFailureResults.isNotEmpty {
            
            // delete all success file
            results.compactMap{ $0.nonFailureResult }
                .forEach{ delete(operation: $0.value) }
            
            let errors = writeFailureResults.map { result -> Error in
                return result.error
            }
            
            return .failure(GeneralError.multipleError(errors))
        }
        
        return .success(operation)
    }
}


//public func isFolder(atPath path: String) -> Bool {
//    var objCBool: ObjCBool = false
//    
//    guard fileExists(atPath: path, isDirectory: &objCBool) else {
//        return false
//    }
//
//    return objCBool.boolValue
//}
