import XcodeTemplate

extension Template {
    internal func toUserDescription() -> String {
        return "\(self.rawValue)). \(self.name)"
    }
}
