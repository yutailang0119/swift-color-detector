//
//  RGBColorSyntaxVisitor.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/04/17.
//

import Foundation
import SwiftSyntax

internal class RGBColorSyntaxVisitor: SyntaxVisitor, RGBColorDetectable, SyntaxNodeDumpable {

    let filePath: URL

    init(filePath: URL) {
        self.filePath = filePath
    }

    override func visit(_ node: FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
        guard let rgbColor = detectRGBColor(from: node) else {
            return .visitChildren
        }

        let colorInitializerSyntax = node.withArgumentList(rgbColor.hexInitializerArgumentListSyntax)
        let dumpPrefix = dumpInfo(of: node)
        print("\(dumpPrefix) \(node.description) -> \(colorInitializerSyntax)")

        return .visitChildren
    }

}
