//
//  ProductModel.swift
//  Nikora
//
//  Created by Nika Jamatashvili on 11.12.23.
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
    let imageName: String
    
    var discountedPrice: Double {
            return isOnSale ? price * 0.8 : price
        }
    
    init(id: UUID, name: String, brandName: String, price: Double, stock: Int, quantity: Int, isOnSale: Bool, imageName: String) {
        self.id = id
        self.name = name
        self.brandName = brandName
        self.price = price
        self.stock = stock
        self.quantity = quantity
        self.isOnSale = isOnSale
        self.imageName = imageName
    }
}
