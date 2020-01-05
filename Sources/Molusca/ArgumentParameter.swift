import XcodeTemplate

internal struct ArgumentParameter {
    internal var destination: String?
    internal var name: String?
    internal var authorName: String?
    internal var templateType: Template?
    internal var checkHelp: Bool = false
    internal var checkVersion: Bool = false
    
    internal var valueSummary: String? {
        guard let destination = destination, let name = name, let authorName = authorName, let template = templateType else {
            return nil
        }
        
        return """
        ✅ Path: \(destination)
        ✅ Template: \(template.name)
        ✅ TargetName: \(name)
        ✅ Author: \(authorName)
        """
    }
    
    internal init(destination: String, name: String, authorName: String, template: Template) {
        self.destination = destination
        self.name = name
        self.authorName = authorName
        self.templateType = template
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
            case _ where Argument.template.identifier.contains(argument):
                guard let value = arguments[safe: index], let rawValue = Int(value), let template = Template(rawValue: rawValue) else {
                    break
                }
                
                templateType = template
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
