import ConsoleIO
import Explorer
import XcodeTemplate

/**
 Molusca Configuration
 */
internal let appName = "Molusca"
internal let appVersion = "0.0.1"

public func generate(destination: String, targetName: String, authorName: String, template: Template) {
    output("Generating...", prefix: "⚙️ ")
    
    let content = template.contents(targetName: targetName, authorName: authorName)
    let files = content.map { File(name: $0.fileName + "." + $0.extension, content: $0.content) }
    let explorerOperation = SingleFolderOperation(folder: Folder(name: targetName, files: files), path: destination)
    
    let currentProgressCallback: (String) -> Void = { filename in
        output("✅ \(filename) Generated")
    }
    
    
    let operationResult = Explorer.default.write(operation: explorerOperation, writingStrategy: .overwrite, currentProgressCallback: currentProgressCallback)
    if case let .failure(error) = operationResult {
        output("❌ Generate failed")
        output("   Detail: \(error.localizedDescription)", thenExit: true)
    }
    
    output("✅ Generate Finish with success")
}

internal func wizard(args argumentParameter: ArgumentParameter) {
    // Show Header
    ConsoleIO.outputHeader(appVersion: appVersion)
    
    // Destination value or if nil, ask user to provide one.
    let destination = argumentParameter.destination ?? ConsoleIO.inputDestination()

    // Target name value
    let targetName = argumentParameter.name ?? ConsoleIO.inputTargetName()

    // Author name
    let authorName = argumentParameter.authorName ?? ConsoleIO.inputAuthorName()

    // Template
    let template = argumentParameter.templateType ?? ConsoleIO.inputTemplateType()
    
    // Confirmation
    let isUserConfirm = ConsoleIO.inputConfirmation(destination: destination, name: targetName, authorName: authorName, template: template)

    if !isUserConfirm {
        output("Bye-Bye", prefix: "👋 ", thenExit: true)
    }
    
    // generate
    generate(destination: destination, targetName: targetName, authorName: authorName, template: template)
}

/**
 Initilialize argument parameter
 */
let argumentParameter = ArgumentParameter(with: CommandLine.arguments)

if argumentParameter.checkHelp {
    ConsoleIO.outputHelp()
}

if argumentParameter.checkVersion {
    output("\(appName) current version is \(appVersion)", thenExit: true)
}


if argumentParameter.startWizard {
    wizard(args: argumentParameter)
}

// if no params inputted, will run help
ConsoleIO.outputHelp()
