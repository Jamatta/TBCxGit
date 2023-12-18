//
//  ProductDetailView.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 19.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            URLImage(urlString: product.thumbnail, imageWidht: 400, imageHeight: 280)
            Text(product.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(AppColors.textPrimary)
            Text("Description: \(product.description)")
                .font(.title3)
                .foregroundColor(AppColors.textPrimary)
            Text("Price: $\(product.price)")
                .fontWeight(.bold)
                .foregroundColor(AppColors.textPrimary)
            Text("Discount: \(String(format: "%.1f", product.discountPercentage))%")
            Text("Rating: \(String(format: "%.1f", product.rating))")
            Text("Stock: \(product.stock)")
            Text("Brand: \(product.brand)")
            Text("Category: \(product.category)")

            Spacer()
        }
        .foregroundColor(AppColors.textSecondary)
        .padding()
        .navigationBarTitle(product.title)
    }
}
