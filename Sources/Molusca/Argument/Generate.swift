import ArgumentParser
import ConsoleIO
import Explorer
import Mantle
import XcodeTemplate

internal struct Generate: ParsableCommand {
    internal init() {}
    
    internal static var configuration = CommandConfiguration(
      commandName: "generate",
      abstract: "Generate Xcode Target",
      discussion: "If you want to generate with assist mode, use wizard mode",
      helpNames: .long
    )
    
    @Option(help: "Destination path where Target should be generated")
    internal var destination: String
    
    @Option(help: "Name of the Target")
    internal var name: String
    
    @Option(help: "Author Name")
    internal var author: String
    
    @Option(help: "Template you want to generate, use `template` command if you want to see template list")
    internal var template: Int

    @Flag(help: "Generate with description print out")
    internal var isVerbose: Bool
    
    internal func run() throws {
        guard let template = Template(rawValue: template) else {
            output("Template is not valid", prefix: "❌ ", thenExit: true)
            return
        }
        
        guard Explorer.default.isFileExist(path: destination) else {
            output("Destination doesn't exist", prefix: "❌ ", thenExit: true)
            return
        }
        
        generate(destination: destination, targetName: name, authorName: author, template: template, isVerbose: isVerbose)
    }
}
