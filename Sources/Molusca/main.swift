/**
 Molusca Configuration
 */
internal let appName = "Molusca"
internal let appVersion = "0.0.1"

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
    ConsoleIO.output("\(appName) current version is \(appVersion)", thenExit: true)
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
 Confirmation
 */

ConsoleIO.outputSummary(destination: destination, name: targetName, authorName: authorName)
