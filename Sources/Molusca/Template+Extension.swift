import XcodeTemplate

extension Template {
    func toUserDescription() -> String {
        return "\(self.rawValue)). \(self.name)"
    }
}
