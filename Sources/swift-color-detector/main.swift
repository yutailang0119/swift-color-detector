import SwiftColorDetectKit

let arguments = CommandLine.arguments

guard let subcommand = arguments.dropFirst().first else {
    fatalError("Error: Indeclear arguments")
}

let path = arguments.dropFirst().dropFirst().first

switch subcommand {
case "help":
    let documents = """
    dump \\(path): Dump code
    rewrite \\(path): Add HexColor Comments and Save
    """
    print(documents)
case "dump":
    guard let path = path else {
        fatalError("Error: Indeclear file path")
    }
    let target = Target(path: path)
    try target.detect()
case "rewrite":
    guard let path = path else {
        fatalError("Error: Indeclear file path")
    }
    let target = Target(path: path)
    try target.rewrite()
default:
    fatalError("Error: Indeclear arguments")
}
