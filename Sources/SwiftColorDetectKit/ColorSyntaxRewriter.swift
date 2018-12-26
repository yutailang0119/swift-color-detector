//
//  ColorSyntaxRewriter.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation
import SwiftSyntax

internal class ColorSyntaxRewriter: SyntaxRewriter {
    override func visit(_ node: InitializerClauseSyntax) -> Syntax {
        return ColorInitializerSyntaxRewriter().visit(node)
    }
}

private class ColorInitializerSyntaxRewriter: SyntaxRewriter {
    override func visit(_ node: FunctionCallExprSyntax) -> ExprSyntax {
        guard node.calledExpression.description == "UIColor"
            || node.calledExpression.description == "UIColor.init" else {
                return node
        }
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
        return ColorLiteralSyntaxRewriter(color: color).visit(node)
    }
}

private class ColorLiteralSyntaxRewriter: SyntaxRewriter {

    private let color: Color

    init(color: Color) {
        self.color = color
    }

    override func visit(_ token: TokenSyntax) -> Syntax {
        switch token.tokenKind {
        case .rightParen:
            let colorComment = TriviaPiece.docLineComment(" /* \(color.hex) */ ")
            let trailingTrivia = token.trailingTrivia.appending(colorComment)
            return token.withTrailingTrivia(trailingTrivia)
        default:
            return token
        }
    }

}

