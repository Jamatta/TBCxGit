//
//  HeaderViewModel.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 19.12.23.
//

import SwiftUI

final class HeaderViewModel: ObservableObject {
    
    @Published var balance = 25
    @Published var cartItems = 3
    @Published var totalAmount = 40
    
    func isCheckoutPossible() -> Bool {
        if balance >= totalAmount {
            cartItems = 0
            balance -= totalAmount
            totalAmount = 0
            return true
        } else {
            return false
        }
    }
}
