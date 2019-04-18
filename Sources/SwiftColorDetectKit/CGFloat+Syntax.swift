//
//  CGFloat+Syntax.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/03/28.
//

import Foundation
import SwiftSyntax

extension CGFloat {

    private init?<S: StringProtocol>(_ text: S) {
        guard let number = Double(text) else { return nil }
        self.init(number)
    }

    init?(expression: ExprSyntax) {
        switch expression {
        case let integer as IntegerLiteralExprSyntax:
            self.init(integer.description)
        case let float as FloatLiteralExprSyntax:
            self.init(float.description)
        default:
            return nil
        }
    }

}
