import ArgumentParser
import ConsoleIO
import XcodeTemplate

internal struct Templates: ParsableCommand {
    internal static var configuration = CommandConfiguration(
      commandName: "template",
      abstract: "List Available Xcode Target Templates",
      discussion: ""
    )
    
    internal func run() throws {
        output("""
        Available Templates to be generated (use its number when generating the target)
        \(Template.allCases
            .map{ $0.toUserDescription() }
            .joined(separator: "\n"))
        """)
    }
}
