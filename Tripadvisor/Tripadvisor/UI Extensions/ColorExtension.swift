//
//  ColorExtension.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 13.12.23.
//

import SwiftUI

struct AppColors {
    static let backgroundPrimary = Color(hex: 0xffffff)
    static let backgroundSecondary = Color(hex: 0xF2F2F2)
    static let textPrimary = Color(hex: 0x000000)
    static let textSecondary = Color(hex: 0x333333)
    static let green = Color(hex: 0x70DDA6)
    static let grey = Color(hex: 0xE0E0E0)
    static let biege = Color(hex: 0xFEF7E3)
    static let yellow = Color(hex: 0xE8B53E)
}

extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
