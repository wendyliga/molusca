import ArgumentParser
import ConsoleIO

struct Version: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "version",
      abstract: "\(appName) Current Version"
    )
    
    func run() throws {
        output("\(appName) current version is \(appVersion)", thenExit: true)
    }
}

