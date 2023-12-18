//
//  CategoriesListModel.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI
import NetworkManager

final class CategoriesListModel: ObservableObject {
    //MARK: Properties
    
    @Published var products: [Product] = []
    @Published var categoriesArray: [String] = []
    @Published var arrayRrror: String?
    
    //MARK: init

    init() {
        fetchCategories()
    }
    
    //MARK: Methods

    func fetchCategories() {
        let urlString = "https://dummyjson.com/products"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: ProductsData.self) { result in
            switch result {
            case .success(let data):
                self.products = data.products
                self.extractCategoriesFromProducts() 
            case .failure(let error):
                self.arrayRrror = error.localizedDescription
            }
        }
    }
    
    func extractCategoriesFromProducts() {
        for product in products {
            if !categoriesArray.contains(product.category) {
                categoriesArray.append(product.category)
            }
        }
    }
    
}
