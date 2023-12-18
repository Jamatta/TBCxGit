//
//  CategoryListView.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 19.12.23.
//

import SwiftUI

struct CategoryListView: View {
    
    // MARK: - Properties
    
    var categoryName: String
    @ObservedObject var viewModel: CategoriesListModel
    @State private var selectedProduct: Product? = nil
    
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 20) {
                    ForEach(filteredProductsForCategory(), id: \.id) { product in
                        ProductCardView(thumbnail: product.thumbnail, title: product.title, brand: product.brand, rating: product.rating, price: product.price, discountPercentage: product.discountPercentage)
                            .onTapGesture {
                                selectedProduct = product
                            }
                    }
                }
                .padding(.top, 24)
            }
            .padding(.horizontal, 16)
        }
        .sheet(item: $selectedProduct) { product in
            ProductDetailView(product: product)
        }
        .navigationBarTitle(categoryName)
    }
    
    func filteredProductsForCategory() -> [Product] {
        return viewModel.products.filter { $0.category == categoryName }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(categoryName: "Laptops", viewModel: CategoriesListModel())
    }
}
