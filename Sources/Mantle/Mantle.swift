import ConsoleIO
import Explorer
import XcodeTemplate

public func generate(destination: String, targetName: String, authorName: String, template: Template, isVerbose: Bool = true) {
    output("Generating...", prefix: "⚙️ ")
    
    let content = template.contents(targetName: targetName, authorName: authorName)
    let files = content.map { File(name: $0.fileName + "." + $0.extension, content: $0.content) }
    let explorerOperation = SingleFolderOperation(folder: Folder(name: targetName, files: files), path: destination)
    
    let currentProgressCallback: (String) -> Void = { filename in
        output("✅ \(filename) Generated")
    }
    
    let progressCallback = isVerbose ? currentProgressCallback : nil
    
    let operationResult = Explorer.default.write(operation: explorerOperation, writingStrategy: .overwrite, currentProgressCallback: progressCallback)
    if case let .failure(error) = operationResult {
        output("❌ Generate failed")
        output("   Detail: \(error.localizedDescription)", thenExit: true)
    }
    
    output("✅ Generate Finish with success")
}
