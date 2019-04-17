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

    public func detect() throws {
        let sourceFile = try SyntaxTreeParser.parse(path)
        let visitor = RGBColorSyntaxVisitor(filePath: path)
        visitor.visit(sourceFile)
    }

    public func rewrite() throws {
        let sourceFile = try SyntaxTreeParser.parse(path)
        let rewriter = RGBColorSyntaxRewriter(filePath: path)
        let syntax = rewriter.visit(sourceFile)
        try syntax.description.write(to: path, atomically: true, encoding: .utf8)
    }

}
