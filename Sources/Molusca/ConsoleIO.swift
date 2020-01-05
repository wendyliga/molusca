import Foundation
import ConsoleIO
import XcodeTemplate
import MoluscaHelper

internal class ConsoleIO {
    internal static func outputHelp() {
        output(#"""
         ______        _
        |  ___ \      | |
        | | _ | | ___ | |_   _  ___  ____ ____
        | || || |/ _ \| | | | |/___)/ ___) _  |
        | || || | |_| | | |_| |___ ( (__( ( | |
        |_||_||_|\___/|_|\____(___/ \____)_||_|

        \#(appName) is Simple App to help Generate Xcode Template
        
        Check more at https://github.com/wendyliga/molusca
                                   
        Usage:
        molusca --destination ~/path-to --name target_name --author author_name

        Parameters:
        \#(Argument.allCases
                    .map{ $0.toUserDescription() }
                    .joined(separator: "\n"))
        """#, thenExit: true)
    }
    
    internal static func outputHeader(appVersion: String) {
        output(#"""

        ______        _
        |  ___ \      | |
        | | _ | | ___ | |_   _  ___  ____ ____
        | || || |/ _ \| | | | |/___)/ ___) _  |
        | || || | |_| | | |_| |___ ( (__( ( | |
        |_||_||_|\___/|_|\____(___/ \____)_||_|
        ==========================

        🦠 Welcome to Molusca \#(appVersion) 🦠
        \#(appName) is Simple App to help Generate Xcode Template
        Created by Wendy Liga
            
        use molusca --help to see more about molusca
            
        """#)
    }
    
    internal static func inputDestination() -> String {
        let message = "🔑 Path to Generate a New Target ? (leave blank to use current executable path)"
        let defaultDirectory = FileManager.default.currentDirectoryPath
        
        let validator: (String) -> Bool = { userInputResult -> Bool in
            return FileManager.default.fileExists(atPath: userInputResult)
        }
        
        let checkValidationResult: (String, Bool) -> Void = { result, isValid in
            if !isValid {
                output("\(result) doesn't exist, please try again", to: .error)
            }
        }
        
        let afterValidation: (String) -> Void = { result in
            if result == defaultDirectory {
                output("Path will use \(defaultDirectory)")
            }
        }
 
        return input(message, defaultValue: defaultDirectory, validator: validator, checkValidationResult: checkValidationResult, afterValidation: afterValidation)
    }
    
    internal static func inputTargetName() -> String {
        let message = "🧞‍♂️ What your Target Name ? (like `Configuration`, `Login`)"
        
        let validator: (String) -> Bool = { userInputResult -> Bool in
            return userInputResult.nonEmpty?
                .removeWhiteSpace()
                .isNotEmpty == true
        }
        
        let failedToValidate: () -> Void = {
            output("Value that you input doesn't valid, please try again", to: .error)
        }
        
        let result: String = input(message, validator: validator, failedToValidate: failedToValidate)
        
        return result.removeWhiteSpace()
    }
    
    internal static func inputAuthorName() -> String {
        let message = "👨‍💻 What the Author Name ? (like `Jhon Doe`, `Anakin Skywalker`)"
        
        let validator: (String) -> Bool = { userInputResult -> Bool in
            return userInputResult.nonEmpty?
                .removeWhiteSpace()
                .isNotEmpty == true
        }
        
        let failedToValidate: () -> Void = {
            output("Value that you input doesn't valid, please try again", to: .error)
        }
        
        return input(message, validator: validator, failedToValidate: failedToValidate)
    }
    
    internal static func inputTemplateType() -> Template {
        let message = """
        📦 What Template you want to generate ? (Choose the number)
        \(Template.allCases
            .map{ $0.toUserDescription() }
            .joined(separator: "\n"))
        """
        
        let validator: (String) -> Bool = { userInputResult -> Bool in
            guard let selectedNumber = Int(userInputResult), Template(rawValue: selectedNumber) != nil else {
                return false
            }
            
            return true
        }
        
        let failedToValidate: () -> Void = {
            output("Please select the number of the template", to: .error)
        }
        
        guard let selectedNumber = Int(input(message, validator: validator, failedToValidate: failedToValidate)), let selectedTemplate = Template(rawValue: selectedNumber) else {
            
            output("Something wrong happends, Please try again later.", to: .error, thenExit: true)
            
            // just to satisfied guard.
            return Template(rawValue: -1)!
        }
        
        return selectedTemplate
    }
    
    internal static func inputConfirmation(destination: String, name: String, authorName: String, template: Template) -> Bool {
        let args = ArgumentParameter(destination: destination, name: name, authorName: authorName, template: template)
        
        guard let summary = args.valueSummary else {
             output("Something wrong happends, Please try again later.", to: .error, thenExit: true)
            
            return false
        }
        
        let message = """
        ---------------------------------------
        ⭐️ Configuration Summary
        ---------------------------------------
        \(summary)
        ---------------------------------------
        Is Everything looks good ? (y/n)
        """
        
        let validator: (String) -> Bool = { userInputResult -> Bool in
            let target = userInputResult.lowercased()
            
            guard target == "y" || target == "n" else {
                return false
            }
            
            return true
        }
        
        let failedToValidate: () -> Void = {
            output("Please select yes(y) or no(n) only", to: .error)
        }
        
        return input(message, validator: validator, failedToValidate: failedToValidate) == "y"
    }
}
