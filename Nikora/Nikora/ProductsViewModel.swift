//
//  ProductsViewModel.swift
//  Nikora
//
//  Created by Nika Jamatashvili on 10.12.23.
//

import SwiftUI

class Grocery: Identifiable {
    let id: UUID
    let name: String
    let brandName: String
    var price: Double
    var stock: Int
    var quantity: Int
    
    init(id: UUID, name: String, brandName: String, price: Double, stock: Int, quantity: Int) {
        self.id = id
        self.name = name
        self.brandName = brandName
        self.price = price
        self.stock = stock
        self.quantity = quantity
    }
    
    var formattedPrice: String {
        let formatted = String(format: "%.2f", price)
        return formatted
    }
}

class ProductsViewModel: ObservableObject {
    
    var originalPrices: [Double] = []
    
    init() {
        originalPrices = groceries.map { Double($0.price) }
    }
    
    @Published var groceries: [Grocery] = [
        Grocery(id: UUID(), name: "Milk", brandName: "Farm Fresh", price: 4, stock: 2, quantity: 0),
        Grocery(id: UUID(), name: "Bread", brandName: "Bakery Delights", price: 2, stock: 18, quantity: 0),
        Grocery(id: UUID(), name: "Apples", brandName: "Organic Farms", price: 8, stock: 6, quantity: 0)
    ]
    
    @Published var cart: [Grocery] = []
    
    func addToCart(_ grocery: Grocery) {
        
        guard grocery.stock > 0 else { return }
        
        grocery.quantity += 1
        grocery.stock -= 1
        
        cart.append(grocery)
    }
    
    func removeFromCart(_ grocery: Grocery) {
        guard grocery.quantity > 0 else { return }
        
        grocery.quantity -= 1
        grocery.stock += 1
        
        if let index = cart.firstIndex(where: { $0 === grocery }) {
            cart.remove(at: index)
        }
    }
    
    func applySale(_ isOn: Bool) {
        let salePercentage: Double = isOn ? 0.8 : 1.0
        
        for index in 0..<groceries.count {
            let originalPrice = originalPrices[index]
            let discountedPrice = originalPrice * salePercentage
            groceries[index].price = discountedPrice
        }
    }
    
    func removeLast() {
        groceries.removeLast()
    }
    
    func testClick() {
        groceries[0].quantity += 1
        print("\(groceries[0].name) - \(groceries[0].quantity)")
    }
}
