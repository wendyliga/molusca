internal enum Argument: CaseIterable{
    case name
    case destination
    case author
    case template
    case help
    case version
    
    internal var identifier: [String] {
        switch self {
        case .name:
            return ["--name", "-n"]
        case .destination:
            return ["--destination", "-d"]
        case .author:
            return ["--author", "-a"]
        case .template:
            return ["--template", "-t"]
        case .help:
            return ["--help", "-h"]
        case .version:
            return ["--version", "-v"]
        }
    }
    
    internal var description: String {
        switch self {
        case .name:
            return "Name of the Target"
        case .destination:
            return "Destination path where Target should be generated"
        case .author:
            return "Author Name"
        case .help:
            return "Show Help"
        case .version:
            return "\(appName) Current Version"
        case .template:
            return "Template you want ot generate"
        }
    }
    
    /**
     convert current enum to create user description
     
     - Returns: Description for user
     
     Example:
     ```
      --help, -h    Show help
     ```
     */
    internal func toUserDescription() -> String {
        return self.identifier
            .stringValue()
            .withPrefixIdentation()
            .separate(with: self.description, offset: 25)
    }
}
