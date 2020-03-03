import ArgumentParser
import ConsoleIO
import Explorer
import Mantle
import XcodeTemplate

struct Wizard: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "wizard",
      abstract: "Generate with guidance",
      discussion: "Use this mode if want to get guidance"
    )
    
    func run() throws {
        wizard()
    }
}

func wizard() {
    // Destination value or if nil, ask user to provide one.
    let destination = inputDestination()

    // Target name value
    let targetName = inputTargetName()

    // Author name
    let authorName = inputAuthorName()

    // Template
    let template = inputTemplateType()
    
    // Confirmation
    let isUserConfirm = inputConfirmation(destination: destination, name: targetName, authorName: authorName, template: template)

    if !isUserConfirm {
        output("Bye-Bye", prefix: "👋 ", thenExit: true)
    }
    
    // generate
    generate(destination: destination, targetName: targetName, authorName: authorName, template: template)
}

func inputDestination() -> String {
   let message = "🔑 Path to Generate a New Target ? (leave blank to use current executable path)"
    let defaultDirectory = Explorer.default.currentDirectoryPath
   
    let validator: (String) -> Bool = { userInputResult -> Bool in
        return Explorer.default.isFileExist(path: userInputResult)
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
   
func inputTargetName() -> String {
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
   
func inputAuthorName() -> String {
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
   
func inputTemplateType() -> Template {
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
   
func inputConfirmation(destination: String, name: String, authorName: String, template: Template) -> Bool {
   let summary =
   """
   ✅ Path: \(destination)
   ✅ Template: \(template.name)
   ✅ Target Name: \(name)
   ✅ Author: \(authorName)
   """

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
