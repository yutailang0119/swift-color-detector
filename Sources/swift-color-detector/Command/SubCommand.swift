//
//  SubCommand.swift
//  FileScanKit
//
//  Created by Yutaro Muta onSubCommand4/18.
//

import Foundation
import SwiftColorDetectKit
import FileScanKit

enum SubCommand {
    case help
    case dump(filePaths: [URL])
    case rewrite(filePaths: [URL])

    init(name: String, path: String?) {
        func scanFilePaths(from path: String?) -> [URL] {
            guard let fileScanner = FileScanner(path: path) else {
                fatalError("Error: Indeclear file path")
            }
            let option = FileScanKit.Option(recursion: .all,
                                            fileExtension: .swift,
                                            ignorePaths: [])
            let result = fileScanner.scan(with: option)

            switch result {
            case .success(let filePaths):
                return filePaths
            case .failure(let error):
                print(error)
                fatalError()
            }
        }

        switch name {
        case "help":
            self = .help
        case "dump":
            let filePaths = scanFilePaths(from: path)
            self = .dump(filePaths: filePaths)
        case "rewrite":
            let filePaths = scanFilePaths(from: path)
            self = .rewrite(filePaths: filePaths)
        default:
            fatalError("Error: Indeclear arguments")
        }
    }

    func excute() throws {
        switch self {
        case .help:
            let documents = """
                            dump \\(path): Dump code
                            rewrite \\(path): Add HexColor Comments and Save
                            """
            print(documents)
        case .dump(let filePaths):
            let target = Target(filePaths: filePaths)
            try target.detect()
        case .rewrite(let filePaths):
            let target = Target(filePaths: filePaths)
            try target.rewrite()
        }
    }
}
