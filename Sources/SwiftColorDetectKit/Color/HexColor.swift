//
//  HexColor.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2019/03/28.
//

import Foundation

struct HexColor: Color {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat

    init?(hex string: String, alpha: CGFloat) {
        let hex = string.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hex)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            self.red = CGFloat((color & 0xFF0000) >> 16) / 255.0
            self.green = CGFloat((color & 0x00FF00) >> 8) / 255.0
            self.blue = CGFloat(color & 0x0000FF) / 255.0
            self.alpha = alpha
        } else {
            return nil
        }
    }
}
