//
//  HotelCellView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 14.12.23.
//

import SwiftUI

struct HotelCellView: View {
    
    let hotel: Hotel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "building.2.fill")
                .font(Font.system(size: 40))
                .foregroundColor(AppColors.backgroundSecondary)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(hotel.name)
                    .font(Font.system(size: 20))
                    .bold()
                    .foregroundColor(AppColors.textPrimary)
                
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(AppColors.yellow)
                    Text(String(format: "%.2f", hotel.rating))
                        .font(Font.system(size: 16))
                        .bold()
                        .foregroundColor(AppColors.textSecondary)
                }
            }
            .padding(12)
            
            Spacer()
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(AppColors.backgroundPrimary)
        .cornerRadius(12)
        
    }
}
