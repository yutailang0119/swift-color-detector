//
//  Color+Syntax.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/03/23.
//

import Foundation
import SwiftSyntax

extension Color {
    func rewriteInitilizerArgumentListSyntax() -> FunctionCallArgumentListSyntax {
        let label = SyntaxFactory.makeIdentifier("hex")
        let colon = SyntaxFactory.makeIdentifier(": ")
        let value = SyntaxFactory.makeIdentifier("\(hex)\"")
        let expression = SyntaxFactory.makeStringLiteralExpr(stringLiteral: value)
        let argument = SyntaxFactory.makeFunctionCallArgument(label: label, colon: colon, expression: expression, trailingComma: nil)
        let argumentList = SyntaxFactory.makeFunctionCallArgumentList([argument])
        return argumentList
    }
}
