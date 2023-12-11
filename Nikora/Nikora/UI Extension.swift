//
//  UI Extension.swift
//  Nikora
//
//  Created by Nika Jamatashvili on 10.12.23.
//

import SwiftUI

struct CustomColors {
    static let backgroundPrimary = Color(hex: 0xFDFDFE)
    static let backgroundSecondary = Color(hex: 0xF6F7FC)
    static let textPrimary = Color(hex: 0x051E47)
    static let textSecondary = Color(hex: 0x9BA6B8)
    static let textTertiary = Color(hex: 0xB7BBC5)
    static let lightBlue = Color(hex: 0x2996FB)
    static let DarkBlue = Color(hex: 0x3077CE)
    static let skyBlue = Color(hex: 0x47B0FF)
}

extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

//      LinearGradient(gradient: Gradient(colors: [
//          CustomColors.lightBlue,
//          CustomColors.DarkBlue
//      ]), startPoint: .leading, endPoint: .trailing)
//      .edgesIgnoringSafeArea(.all)
