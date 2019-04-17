//
//  RGBColorSyntaxVisitor.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/04/17.
//

import Foundation
import SwiftSyntax

internal class RGBColorSyntaxVisitor: SyntaxVisitor, RGBColorDetectable {

    private let filePath: URL

    init(filePath: URL) {
        self.filePath = filePath
    }

    override func visit(_ node: FunctionCallExprSyntax) {
        guard let rgbColor = detectRGBColor(from: node) else {
            return
        }

        let colorInitializer = node.withArgumentList(rgbColor.hexInitializerArgumentListSyntax)
        let path = filePath.isFileURL ? filePath.path : filePath.absoluteString
        print("[\(path), \(node.position.line), \(node.position.column)] \(node.description) -> \(colorInitializer)")
    }

}
