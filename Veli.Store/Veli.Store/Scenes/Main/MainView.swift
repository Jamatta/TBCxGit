//
//  MainView.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    @State private var selectedTab = 0
    @State private var selectedProduct: Product? = nil
    
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        
        TabView(selection: $selectedTab) {
            VStack {
                HeaderComponentView(viewmodel: HeaderViewModel())
                productsPageView
            }
            .tabItem {
                Image(systemName: "square.3.layers.3d.top.filled")
                Text("Products")
            }
            .tag(0)
            
            CategoriesView(viewModel: CategoriesListModel())
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("Categories")
                }
                .tag(1)
        }
    }
    
    // MARK: - Components
    private var productsPageView: some View {
        
        return NavigationView {
            
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 20) {
                    ForEach(viewModel.products) { product in
                        ProductCardView(thumbnail: product.thumbnail, title: product.title, brand: product.brand, rating: product.rating, price: product.price, discountPercentage: product.discountPercentage)
                            .onTapGesture {
                                selectedProduct = product
                            }
                    }
                }.padding(.top, 24)
            }
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
            .padding(.horizontal, 16)
            .ignoresSafeArea()
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
