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
    var isOnSale: Bool
    
    var discountedPrice: Double {
            return isOnSale ? price * 0.8 : price
        }
    
    init(id: UUID, name: String, brandName: String, price: Double, stock: Int, quantity: Int, isOnSale: Bool) {
        self.id = id
        self.name = name
        self.brandName = brandName
        self.price = price
        self.stock = stock
        self.quantity = quantity
        self.isOnSale = isOnSale
    }
}


class ProductsViewModel: ObservableObject {
    
    var originalPrices: [Double] = []
    
    init() {
        originalPrices = groceries.map { Double($0.price) }
    }
    
    @Published var groceries: [Grocery] = [
        Grocery(id: UUID(), name: "Milk", brandName: "Farm Fresh", price: 4, stock: 2, quantity: 0, isOnSale: false),
        Grocery(id: UUID(), name: "Bread", brandName: "Bakery Delights", price: 2, stock: 18, quantity: 0, isOnSale: false),
        Grocery(id: UUID(), name: "Apples", brandName: "Organic Farms", price: 8, stock: 6, quantity: 0, isOnSale: false)
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
        
        for index in 0..<groceries.count {
            groceries[index].isOnSale = !groceries[index].isOnSale
            print("\(groceries[index].isOnSale)")
        }
      //  objectWillChange.send()
    }
    
    func printPrice() {
        for index in 0..<groceries.count {
            print("price - ", groceries[index].price)

        }
    }
}
