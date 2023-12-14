//
//  MustSeePlaceCellView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 14.12.23.
//

import SwiftUI

struct MustSeePlaceCellView: View {
    
    let mustSeePlace: MustSeePlace
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(mustSeePlace.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minHeight: 220, maxHeight: 220)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(mustSeePlace.name)
                    .font(Font.system(size: 20))
                    .bold()
                    .foregroundColor(AppColors.textPrimary)
                Text(mustSeePlace.description)
                    .font(Font.system(size: 16))
                    .foregroundColor(AppColors.textSecondary)
            }
        }
        .padding(16)
        .background(AppColors.backgroundPrimary)
        .cornerRadius(12)
    }
}
