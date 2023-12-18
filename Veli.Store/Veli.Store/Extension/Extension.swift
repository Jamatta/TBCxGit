//
//  Extension.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI

struct AppColors {
    static let backgroundPrimary = Color(hex: 0xF9F9FA)
    static let backgroundSecondary = Color(hex: 0xF2F4F4)
    static let CTAColor = Color(hex: 0x0F1214)
    static let textPrimary = Color(hex: 0x262A3C)
    static let textSecondary = Color(hex: 0xADB3B7)
    static let green = Color(hex: 0x0FD59E)
    static let sky = Color(hex: 0x13D3FA)
    static let yellow = Color(hex: 0xF5DE5D)
}

extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

extension Button {
    var primaryButtonStyle: some View {
        self
            .padding(.horizontal, 40)
            .frame(height: 48)
            .background(AppColors.CTAColor)
            .foregroundStyle(AppColors.backgroundPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 24))
    }
    
    var secondaryButtonStyle: some View {
        self
            .padding(.horizontal, 24)
            .frame(height: 40)
            .foregroundStyle(AppColors.textPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .strokeBorder(AppColors.textSecondary, lineWidth: 1)
            )
    }
}
