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
    private let filePaths: [URL]

    public init(filePaths: [URL]) {
        self.filePaths = filePaths
    }

    public func detect() throws {
        try filePaths.forEach { path in
            let sourceFile = try SyntaxTreeParser.parse(path)
            let visitor = RGBColorSyntaxVisitor(filePath: path)
            sourceFile.walk(visitor)
        }
    }

    public func rewrite() throws {
        try filePaths.forEach { path in
            let sourceFile = try SyntaxTreeParser.parse(path)
            let rewriter = RGBColorSyntaxRewriter(filePath: path)
            let syntax = rewriter.visit(sourceFile)
            try syntax.description.write(to: path, atomically: true, encoding: .utf8)
        }
    }

}
