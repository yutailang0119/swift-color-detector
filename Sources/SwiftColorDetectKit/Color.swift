//
//  Color.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation

internal struct Color {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat

    init?(red: CGFloat?, green: CGFloat?, blue: CGFloat?, alpha: CGFloat?) {
        guard let red = red,
            let green = green,
            let blue = blue,
            let alpha = alpha else {
                return nil
        }
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    var hex: String{
        let rgb = Int(red * 255) << 16 | Int(green * 255) << 8 | Int(blue * 255) << 0
        return String(format: "#%06x", rgb).uppercased()
    }

    var colorLiteral: String{
        return "#colorLiteral(red: \(red), green: \(green), blue: \(blue), alpha: \(alpha)"
    }

}
