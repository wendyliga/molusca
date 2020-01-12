import ConsoleIO
import Explorer
import XcodeTemplate

let template = Template.unitTest
    .contents(targetName: "Test", authorName: "Wendy Liga")
    .map { File(name: $0.fileName + "." + $0.extension, content: $0.content) }

let batchOperation = BatchFileOperation(files: template, path: "/Users/wendyliga/code/molusca")


do {
    let result = try Explorer.default.write(operation: batchOperation, writingStrategy: .overwrite).get()
    print(">>> result \(result)")
} catch let error {
    print(">>> error: \(error.localizedDescription)")
}
    
//template.forEach{
//    print(">>> \($0.name) \(Explorer.default.write(file: $0, at: , writingStrategy: .overwrite))")
//}

//for file in files {
//    let file =
    
//}


/**
 Molusca Configuration
 */
internal let appName = "Molusca"
internal let appVersion = "0.0.1"

/*
/**
 Initilialize argument parameter
 */
let argumentParameter = ArgumentParameter(with: CommandLine.arguments)

// MARK: - Help mode

/**
 Help Mode
 */
if argumentParameter.checkHelp {
    ConsoleIO.outputHelp()
}

// MARK: - Check Version

/**
 Check Version
 */
if argumentParameter.checkVersion {
    output("\(appName) current version is \(appVersion)", thenExit: true)
}

// MARK: - Main

/**
 Show Header
 */
ConsoleIO.outputHeader(appVersion: appVersion)

/**
 Destination value or if nil, ask user to provide one.
 */
let destination = argumentParameter.destination ?? ConsoleIO.inputDestination()

/**
 Target name value
 */
let targetName = argumentParameter.name ?? ConsoleIO.inputTargetName()

/**
 Author name
 */
let authorName = argumentParameter.authorName ?? ConsoleIO.inputAuthorName()

/**
 Template
 */
let template = argumentParameter.templateType ?? ConsoleIO.inputTemplateType()

/**
 Confirmation
 */

let isUserConfirm = ConsoleIO.inputConfirmation(destination: destination, name: targetName, authorName: authorName, template: template)

if !isUserConfirm {
    output("Bye-Bye", prefix: "👋 ", thenExit: true)
}

output("continue to generation")
*/
