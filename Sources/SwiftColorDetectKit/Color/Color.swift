//
//  Color.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/03/28.
//

import Foundation
import SwiftSyntax

protocol Color {
    var red: CGFloat { get }
    var green: CGFloat { get }
    var blue: CGFloat { get }
    var alpha: CGFloat { get }
}

extension Color {
    var hex: String {
        let rgb = Int(red * 255) << 16 | Int(green * 255) << 8 | Int(blue * 255) << 0
        return String(format: "#%06x", rgb).uppercased()
    }

    var colorLiteral: String {
        return "#colorLiteral(red: \(red), green: \(green), blue: \(blue), alpha: \(alpha)"
    }
}

extension Color {
    var hexInitializerArgumentListSyntax: FunctionCallArgumentListSyntax {
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
