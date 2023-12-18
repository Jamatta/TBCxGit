//
//  ProductCardView.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI

struct ProductCardView: View {
    
    // MARK: - Properties
    var thumbnail: String
    var title: String
    var brand: String
    var rating: Double
    var price: Int
    var discountPercentage: Double
    
    var actualPrice: Double {
        let discountedAmount = Double(price) * (discountPercentage / 100.0)
        return Double(price) - discountedAmount
    }
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16)  {
            URLImage(urlString: thumbnail, imageWidht: 148, imageHeight: 100)
            VStack(alignment: .leading, spacing: 16) {
                itemMainInfo
                itemInfo
            }
        }
        .padding(12)
        .frame(width: 180)
        .background(.white)
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(AppColors.textSecondary.opacity(0.32), lineWidth: 1)
            
        )
    }
    // MARK: - Components

    private var itemInfo: some View {
        return HStack(alignment: .center) {
            itemRatingInfo
            Spacer()
            itemPriceInfo
        }
    }
    
    private var itemMainInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(Font.system(size: 18))
                .lineLimit(1)
                .bold()
                .foregroundColor(AppColors.textPrimary)
            Text(brand)
                .lineLimit(1)
                .foregroundColor(AppColors.textSecondary)
                .bold()
        }
    }
    
    private var itemRatingInfo: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(AppColors.yellow)
            Text(String(format: "%.1f", rating))
                .bold()
        }
    }
    
    private var itemPriceInfo: some View {
        HStack(alignment: .center, spacing: 4) {
            Text("$")
                .foregroundColor(AppColors.textSecondary)
                .bold()
            Text(String(format: "%.0f", actualPrice))
                .font(Font.system(size: 16))
                .bold()
                .foregroundColor(AppColors.textPrimary)
        }
    }
}

// MARK: - Preview

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(thumbnail: "rand", title: "iPhone", brand: "Apple", rating: 4.8, price: 1800, discountPercentage: 15)
    }
}
