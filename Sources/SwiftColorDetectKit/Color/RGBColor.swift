//
//  RGBColor.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation

struct RGBColor: Color {
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

}
