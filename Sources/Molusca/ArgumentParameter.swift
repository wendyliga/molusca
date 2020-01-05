internal struct ArgumentParameter {
    internal var destination: String?
    internal var name: String?
    internal var authorName: String?
    internal var checkHelp: Bool = false
    internal var checkVersion: Bool = false
    
    internal var valueSummary: String? {
        guard let destination = destination, let name = name, let authorName = authorName else {
            return nil
        }
        
        return """
        ✅ Path: \(destination)
        ✅ TargetName: \(name)
        ✅ Author: \(authorName)
        """
    }
    
    internal init(destination: String, name: String, authorName: String) {
        self.destination = destination
        self.name = name
        self.authorName = authorName
    }
    
    internal init(with arguments: [String]) {
        for (index, argument) in arguments.enumerated() {
            switch argument.lowercased() {
            case _ where Argument.name.identifier.contains(argument):
                name = arguments[safe: index]
            case _ where Argument.destination.identifier.contains(argument):
                destination = arguments[safe: index]
            case _ where Argument.author.identifier.contains(argument):
                authorName = arguments[safe: index]
            case _ where Argument.help.identifier.contains(argument):
                checkHelp = true
            case _ where Argument.version.identifier.contains(argument):
                checkVersion = true
            default:
                break
            }
        }
    }
}
