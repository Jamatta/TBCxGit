//
//  DestinationCardView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 13.12.23.
//

import SwiftUI

struct DestinationCardView: View {
    
    let destination: Destination
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(destination.imageName)
                .resizable()
                .frame(width: 160, height: 110)
                .mask(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .path(in: CGRect(x: 0, y: 0, width: 160, height: 110))
                )
            
            VStack(alignment: .leading) {
                Text(destination.name)
                    .foregroundColor(AppColors.textPrimary)
                    .font(Font.system(size: 18))
                    .bold()
                Text(destination.country)
                    .foregroundColor(AppColors.textSecondary)
                    .font(Font.system(size: 14))
                
            }
            .padding(8)
            
        }
        .padding(8)
        .background(AppColors.backgroundPrimary)
        .cornerRadius(12)
        
    }
}
