//
//  ColorDetectable.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/04/17.
//

import Foundation
import struct SwiftSyntax.FunctionCallExprSyntax

protocol ColorDetectable {}

extension ColorDetectable {
    func isUIColorInitializer(of node: FunctionCallExprSyntax) -> Bool {
        return
            (node.calledExpression.description == "UIColor" && node.leftParen != nil) // UIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
                ||
                node.calledExpression.description == "UIColor.init" // UIColor.init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    }
}
