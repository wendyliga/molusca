import Foundation
import MoluscaHelper

internal final class ConsoleIO {
    /**
     Retreive Input from user
     
     - Parameters:
        - message: message to show to user
        - defaultValue: value that defaultly apply if user don't input anything
        - validator: closure that will return `Bool`, that let's user determine is value is already valid or not
        - checkValidationResult: any execution you want to execute after validator executing its task and before next action is being executed, `T` for the result user input and `Bool` for validation result
        - afterValidation: execute action after validation finish, will bring `T` value
     - Returns: will return `T`
     
     Example:
        ```
        let result = input("number of random?", defaultValue: 0) { userInputResult in
            return userInputResult < 100
        }
        ```
     */
    internal static func input<T>(_ message: String, defaultValue: T, validator: (T) -> Bool, checkValidationResult: ((_ result: T,_ validationResult: Bool) -> Void)? = nil, afterValidation: ((T) -> Void)? = nil) -> T {
        // output message
        output(message)
        
        // result value safe here
        var result: T
        
        if let userInput = readLine()?.nonEmpty as? T {
            let validationResult = validator(userInput)
            
            // execute action after validation
            checkValidationResult?(userInput, validationResult)
            
            // check validation result
            guard validationResult else {
                // retry if false
                return ConsoleIO.input(message, defaultValue: defaultValue, validator: validator, checkValidationResult: checkValidationResult)
            }
            
            result = userInput
        }
        
        // use default value
        result = defaultValue
        
        // execute after validation action
        defer {
            afterValidation?(result)
        }
        
        // return value
        return result
    }
    
    /**
    Retreive Input from user without default value, so user need to input until its satisfied the validator
    
     - Parameters:
        - message: message to show to user
        - validator: closure that will return `Bool`, that let's user determine is value is already valid or not
        - failedToValidate: any execution you want to execute after validator resulting failed
    
    - Returns: will return `T`
    
    Example:
       ```
       let result = input("number of random?") { userInputResult in
           return userInputResult < 5
       }
       ```
    */
    internal static func input<T>(_ message: String, validator: (T) -> Bool, failedToValidate executeFailedValidationAction: (() -> Void)?) -> T {
        // output message
        output(message)
        
        guard let result = readLine()?.nonEmpty as? T, validator(result) else {
            // execute action after validation
            executeFailedValidationAction?()
            
            return ConsoleIO.input(message, validator: validator, failedToValidate: executeFailedValidationAction)
        }
        
        return result
    }
    
    internal enum OutputType {
        case error
        case standard
        case warning
        
        internal var statusCode: Int32 {
            switch self {
            case .error:
                return 0
            case .standard, .warning:
                return 1
            }
        }
        
        internal var defaultPrefix: String? {
            switch self {
            case .error:
                return "🙅‍♂️"
            case .warning:
                return "⚠️"
            default:
                return nil
            }
        }
    }
    
    /**
     Output to console to user
     
     you can choose type of the output and exit or not after it.
     */
    internal static func output(_ message: String, to type: OutputType = .standard, prefix: String? = nil, thenExit: Bool = false) {
        
        let defaultPrefix = prefix ?? type.defaultPrefix
        let outputMessage = defaultPrefix == nil ? message : "\(defaultPrefix!) \(message)"
        
        switch type {
        case .standard, .warning:
            print(outputMessage)
        case .error:
            fputs(outputMessage, stderr)
        }
        
        if thenExit{
            exit(type.statusCode)
        }
    }
}

extension ConsoleIO {
    internal static func outputHelp() {
        ConsoleIO.output(#"""
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
        ConsoleIO.output(#"""

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
    
    internal static func outputSummary(destination: String, name: String, authorName: String) {
        let args = ArgumentParameter(destination: destination, name: name, authorName: authorName)
        
        guard let summary = args.valueSummary else {
            ConsoleIO.output("Something wrong happends, Please try again later.", to: .error, thenExit: true)
            
            return
        }
        
        // output summary
        let output = """

        ---------------------------------------
        ⭐️ Configuration Summary
        ---------------------------------------
        \(summary)
        """
        
        ConsoleIO.output(output)
    }
    
    internal static func inputDestination() -> String {
        let message = "📦 Path to Generate a New Target ? (leave blank to use current executable path)"
        let defaultDirectory = FileManager.default.currentDirectoryPath
        
        let validator: (String) -> Bool = { userInputResult -> Bool in
            return FileManager.default.fileExists(atPath: userInputResult)
        }
        
        let checkValidationResult: (String, Bool) -> Void = { result, isValid in
            if !isValid {
                ConsoleIO.output("\(result) doesn't exist, please try again", to: .error)
            }
        }
        
        let afterValidation: (String) -> Void = { result in
            if result == defaultDirectory {
                ConsoleIO.output("Path will use \(defaultDirectory)")
            }
        }
 
        return ConsoleIO.input(message, defaultValue: defaultDirectory, validator: validator, checkValidationResult: checkValidationResult, afterValidation: afterValidation)
    }
    
    internal static func inputTargetName() -> String {
        let message = "🧞‍♂️ What your Target Name ? (like `Configuration`, `Login`)"
        
        let validator: (String) -> Bool = { userInputResult -> Bool in
            return userInputResult.nonEmpty?
                .removeWhiteSpace()
                .isNotEmpty == true
        }
        
        let failedToValidate: () -> Void = {
            ConsoleIO.output("value that you input doesn't valid, please try again", to: .error)
        }
        
        let result: String = ConsoleIO.input(message, validator: validator, failedToValidate: failedToValidate)
        
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
            ConsoleIO.output("value that you input doesn't valid, please try again", to: .error)
        }
        
        return ConsoleIO.input(message, validator: validator, failedToValidate: failedToValidate)
    }
}
