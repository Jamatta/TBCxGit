//
//  ProductsViewModel.swift
//  Nikora
//
//  Created by Nika Jamatashvili on 10.12.23.
//

import SwiftUI

class ProductsViewModel: ObservableObject {
    
    var originalPrices: [Double] = []
    
    init() {
        originalPrices = groceries.map { Double($0.price) }
    }
    
    @Published var groceries: [Grocery] = [
        Grocery(id: UUID(), name: "ორეო", brandName: "Nabisco", price: 3.99, stock: 24, quantity: 0, isOnSale: false, imageName: "oreo"),
        Grocery(id: UUID(), name: "ბუღა", brandName: "Red Bull", price: 2.49, stock: 30, quantity: 0, isOnSale: false, imageName: "buga"),
        Grocery(id: UUID(), name: "სანტინო", brandName: "Farm Fresh", price: 2.29, stock: 8, quantity: 0, isOnSale: false, imageName: "santino"),
        Grocery(id: UUID(), name: "ნესკაფე", brandName: "Starbucks", price: 8.99, stock: 12, quantity: 0, isOnSale: false, imageName: "gold")
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
        }
        objectWillChange.send()
    }
    
    func clearCart() {
        for index in 0..<cart.count {
            cart[index].quantity -= 1
            cart[index].stock += 1
        }
        cart.removeAll()
    }
    
    func calculateTotalPrice() -> String {
        var totalPrice: Double = 0.0
        
        for index in 0..<cart.count {
            totalPrice += cart[index].price
        }
        
        if let firstItem = cart.first, firstItem.isOnSale {
            totalPrice *= 0.8
        }
        
        let formattedPrice = String(format: "%.2f", totalPrice)
        
        return formattedPrice
    }
}
