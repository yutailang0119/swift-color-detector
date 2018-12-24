//
//  Target.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation
import SwiftSyntax

public struct Target {

    private let fileManager = FileManager.default
    private let path: URL

    public init(path: String) {
        guard fileManager.fileExists(atPath: path) else {
            fatalError("Error: File does not exist")
        }
        self.path = URL(fileURLWithPath: path)
    }

    public func detect() throws -> String {
        let sourceFile = try SyntaxTreeParser.parse(path)
        let syntax = ColorSyntaxRewriter().visit(sourceFile)
        return syntax.description
    }

    public func rewrite() throws {
        let detected = try detect()
        try detected.write(to: path, atomically: true, encoding: .utf8)
    }

}
