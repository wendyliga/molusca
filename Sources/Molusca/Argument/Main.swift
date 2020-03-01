import ArgumentParser

struct Molusca: ParsableCommand {
    static var abstract: String {
        #"""
        
         ______        _
        |  ___ \      | |
        | | _ | | ___ | |_   _  ___  ____ ____
        | || || |/ _ \| | | | |/___)/ ___) _  |
        | || || | |_| | | |_| |___ ( (__( ( | |
        |_||_||_|\___/|_|\____(___/ \____)_||_|
        
        🦠 \#(appName) is Simple App to Generate Xcode Template
        
        Check more at \#(githubPage)
        """#
    }
    
    static let subCommands: [ParsableCommand.Type] = [Generate.self, Templates.self, Wizard.self, Version.self]
    
    static var configuration = CommandConfiguration(abstract: abstract, discussion: "", subcommands: subCommands)
}
