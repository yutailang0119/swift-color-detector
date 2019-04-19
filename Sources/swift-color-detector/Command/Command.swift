//
//  Command.swift
//  FileScanKit
//
//  Created by Yutaro Muta on 2019/04/18.
//

import Foundation

struct Command {
    private let subCommand: SubCommand

    init(arguments: [String]) {
        guard let commandName = arguments.dropFirst().first else {
            fatalError("Error: Indeclear arguments")
        }
        let path = arguments.dropFirst(2).first
        self.subCommand = SubCommand(name: commandName, path: path)
    }

    func excute() {
        do {
            try subCommand.excute()
        } catch {
            print(error)
            fatalError()
        }
    }

}
