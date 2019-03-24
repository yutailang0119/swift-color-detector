//
//  ColorSyntaxRewriter.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation
import SwiftSyntax

internal class ColorSyntaxRewriter: SyntaxRewriter {

    override func visit(_ node: FunctionCallExprSyntax) -> ExprSyntax {
        guard isUIColorInitializer(of: node) else {
            return node
        }

        return rewriteColorFunctionCallExprSyntax(node)
    }

    private func isUIColorInitializer(of node: FunctionCallExprSyntax) -> Bool {
        return
            (node.calledExpression.description == "UIColor" && node.leftParen != nil) // UIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
            ||
            node.calledExpression.description == "UIColor.init" // UIColor.init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    }

    private func rewriteColorFunctionCallExprSyntax(_ node: FunctionCallExprSyntax) -> ExprSyntax {
        var red, green, blue, alpha: CGFloat?
        node.argumentList.forEach { argumentSyntax in
            guard let label = argumentSyntax.label else {
                return
            }
            switch label.text {
            case "red":
                red = CGFloat(argumentSyntax.expression.description)
            case "green":
                green = CGFloat(argumentSyntax.expression.description)
            case "blue":
                blue = CGFloat(argumentSyntax.expression.description)
            case "alpha":
                alpha = CGFloat(argumentSyntax.expression.description)
            default:
                break
            }
        }
        guard let color = Color(red: red, green: green, blue: blue, alpha: alpha) else {
            return node

        }
        return node.withArgumentList(color.rewriteInitializerArgumentListSyntax())
    }

}
