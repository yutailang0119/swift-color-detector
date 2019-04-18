//
//  SyntaxNodeDumpable.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/04/17.
//

import Foundation
import protocol SwiftSyntax.Syntax

protocol SyntaxNodeDumpable {
    var filePath: URL { get }
}

extension SyntaxNodeDumpable {
    func dumpInfo(of node: Syntax) -> String {
        let path = filePath.scheme == "file" ? filePath.path : filePath.absoluteString
        return "[\(path), \(node.position.line), \(node.position.column)]"
    }
}
