//
//  HeaderComponentView.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI

struct HeaderComponentView: View {
    
    @ObservedObject var viewmodel: HeaderViewModel
    
    @State private var showAlert = false
    @State private var isCheckoutFailed = false
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .center) {
                Text("Your balance - $\(viewmodel.balance)")
                    .foregroundColor(AppColors.textSecondary)
                
                Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .font(Font.system(size: 28))
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(viewmodel.cartItems) items in cart")
                        .font(Font.system(size: 18))
                        .bold()
                        .foregroundColor(AppColors.textPrimary)
                    HStack {
                        Text("$\(viewmodel.totalAmount)")
                            .font(Font.system(size: 16))
                            .bold()
                        Text(" Total price")
                    }
                    .foregroundColor(AppColors.textSecondary)
                    
                }
                Spacer()
                Button("Check out") {
                    if viewmodel.isCheckoutPossible() {
                        showAlert = true
                    } else {
                        isCheckoutFailed = true
                    }
                    print(viewmodel.isCheckoutPossible())
                }
                .secondaryButtonStyle
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Success!"),
                        message: Text("Your checkout was successful."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .alert(isPresented: $isCheckoutFailed) {
                    Alert(
                        title: Text("Failed!"),
                        message: Text("Oops! The balance is insufficient for checkout"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        .frame(height: 88)
        .padding(20)
        .background(AppColors.backgroundSecondary)
        
    }
}

struct HeaderComponentView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponentView(viewmodel: HeaderViewModel())
    }
}
