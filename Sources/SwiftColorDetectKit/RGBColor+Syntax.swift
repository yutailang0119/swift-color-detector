//
//  RGBColor+Syntax.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/03/23.
//

import Foundation
import SwiftSyntax

extension RGBColor {
    func rewriteInitializerArgumentListSyntax() -> FunctionCallArgumentListSyntax {
        let space = Trivia.init(arrayLiteral: TriviaPiece.spaces(1))
        let colon = SyntaxFactory.makeIdentifier(":").withTrailingTrivia(space)

        let hexArgument = FunctionCallArgumentSyntax { builder in
            let label = SyntaxFactory.makeIdentifier("hex")
            let value = SyntaxFactory.makeStringLiteral("\"\(hex)\"")
            let expression = SyntaxFactory.makeStringLiteralExpr(stringLiteral: value)
            let trailingComma = SyntaxFactory.makeIdentifier(",").withTrailingTrivia(space)
            builder.useLabel(label)
            builder.useColon(colon)
            builder.useExpression(expression)
            builder.useTrailingComma(trailingComma)
        }

        let alphaArgument = FunctionCallArgumentSyntax { builder in
            let label = SyntaxFactory.makeIdentifier("alpha")
            let value = SyntaxFactory.makeFloatingLiteral("\(alpha)")
            let expression = SyntaxFactory.makeFloatLiteralExpr(floatingDigits: value)
            builder.useLabel(label)
            builder.useColon(colon)
            builder.useExpression(expression)
        }

        let argumentList = SyntaxFactory.makeFunctionCallArgumentList([hexArgument, alphaArgument])
        return argumentList
    }
}
