//
//  RGBColorSyntaxRewriter.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation
import SwiftSyntax

internal class RGBColorSyntaxRewriter: SyntaxRewriter, RGBColorDetectable {

    override func visit(_ node: FunctionCallExprSyntax) -> ExprSyntax {
        guard let rgbColor = detectRGBColor(from: node) else {
            return node
        }

        return node.withArgumentList(rgbColor.hexInitializerArgumentListSyntax)
    }

}
