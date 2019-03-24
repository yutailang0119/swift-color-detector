//
//  Color+Syntax.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/03/23.
//

import Foundation
import SwiftSyntax

extension Color {
    func rewriteInitializerArgumentListSyntax() -> FunctionCallArgumentListSyntax {
        let colon = SyntaxFactory.makeIdentifier(": ")

        let hexArgument = FunctionCallArgumentSyntax { builder in
            let label = SyntaxFactory.makeIdentifier("hex")
            let value = SyntaxFactory.makeStringLiteral("\"\(hex)\"")
            let expression = SyntaxFactory.makeStringLiteralExpr(stringLiteral: value)
            let trailingComma = SyntaxFactory.makeIdentifier(", ")
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
