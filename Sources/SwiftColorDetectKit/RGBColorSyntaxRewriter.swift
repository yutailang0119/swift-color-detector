//
//  RGBColorSyntaxRewriter.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation
import SwiftSyntax

internal class RGBColorSyntaxRewriter: SyntaxRewriter, RGBColorDetectable, SyntaxNodeDumpable {

    let filePath: URL

    init(filePath: URL) {
        self.filePath = filePath
    }

    override func visit(_ node: FunctionCallExprSyntax) -> ExprSyntax {
        guard let rgbColor = detectRGBColor(from: node) else {
            return node
        }

        let colorInitializerSyntax = node.withArgumentList(rgbColor.hexInitializerArgumentListSyntax)
        let dumpPrefix = dumpInfo(of: node)
        print("\(dumpPrefix) \(node.description) -> \(colorInitializerSyntax)")

        return colorInitializerSyntax
    }

}
