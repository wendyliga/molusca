import Foundation
import MoluscaHelper

func askForDestination() -> String {
    print("Path to generate a project?")
    let destination = readLine()?.nonEmpty

    let fileManager = FileManager.default

    if let destination = destination {
        guard fileManager.fileExists(atPath: destination) else {
            print("That path doesn't exist. Try again.")
            return askForDestination()
        }

        return destination
    }

    return fileManager.currentDirectoryPath
}

let arguments = Argument(with: CommandLine.arguments)
let destination = arguments.destination ?? askForDestination()
