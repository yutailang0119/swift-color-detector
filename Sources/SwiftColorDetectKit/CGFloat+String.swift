//
//  CGFloat+String.swift
//  SwiftColorDetectKit
//
//  Created by Yutaro Muta on 2018/12/24.
//

import Foundation

import Foundation

extension CGFloat {
    init?<S>(_ text: S) where S : StringProtocol {
        guard let number = Double(text) else { return nil }
        self.init(number)
    }
}
