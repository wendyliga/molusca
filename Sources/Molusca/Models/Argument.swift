import Foundation

struct Argument {
    var destination: String?
    
    init(with arguments: [String]) {
        for (index, argument) in arguments.enumerated() {
            switch argument.lowercased() {
            case "--destination", "-d":
                destination = arguments[safe: index]
            default:
                break
            }
        }
    }
}
