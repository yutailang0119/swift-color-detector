
import Foundation
import FileScanKit

let arguments = CommandLine.arguments

guard let commandName = arguments.dropFirst().first else {
    fatalError("Error: Indeclear arguments")
}
let path = arguments.dropFirst(2).first
let subCommand = SubCommand(name: commandName, path: path)
try subCommand.excute()
