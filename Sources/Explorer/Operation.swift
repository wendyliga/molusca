public struct SingleFileOperation {
    public let file: File
    public let path: String
    
    public init(file: File, path: String) {
        self.file = file
        self.path = path
    }
}

public struct BatchFileOperation {
    public let files: [File]
    public let path: String
    
    public init(files: [File], path: String) {
        self.files = files
        self.path = path
    }
}
