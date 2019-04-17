//
//  RGBColorDetectable.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/04/17.
//

import Foundation
import struct SwiftSyntax.FunctionCallExprSyntax

protocol RGBColorDetectable: ColorDetectable {}

extension RGBColorDetectable {
    func detectRGBColor(from node: FunctionCallExprSyntax) -> RGBColor? {
        guard isUIColorInitializer(of: node) else {
            return nil
        }

        var red, green, blue, alpha: CGFloat?
        node.argumentList.forEach { argumentSyntax in
            guard let label = argumentSyntax.label else {
                return
            }
            switch label.text {
            case "red":
                red = CGFloat(expression: argumentSyntax.expression)
            case "green":
                green = CGFloat(expression: argumentSyntax.expression)
            case "blue":
                blue = CGFloat(expression: argumentSyntax.expression)
            case "alpha":
                alpha = CGFloat(expression: argumentSyntax.expression)
            default:
                break
            }
        }
        guard let rgbColor = RGBColor(red: red, green: green, blue: blue, alpha: alpha) else {
            return nil

        }
        return rgbColor
    }
}
