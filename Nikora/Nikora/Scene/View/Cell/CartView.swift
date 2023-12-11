//
//  CartView.swift
//  Nikora
//
//  Created by Nika Jamatashvili on 11.12.23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: ProductsViewModel
    @Binding var isCartViewActive: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                ScrollView {
                    VStack(spacing: 24) {
                        ForEach(viewModel.cart) { item in
                            ProductCellView(viewModel: viewModel, product: item)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                .navigationBarTitle("კალათაი")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("დახურვა") {
                    isCartViewActive = false
                })
                .navigationBarItems(leading: Button("გასუფთავება") {
                    viewModel.clearCart()
                }
                    .disabled(viewModel.cart.count == 0 ? true : false)
                )
            }
            VStack {
                Text("ჯამური ფასი - \(viewModel.calculateTotalPrice())")
                    .font(.headline)
                    .bold()
                    .foregroundColor(viewModel.cart.count == 0 ? CustomColors.textTertiary : CustomColors.textPrimary)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(.white)
        }
        
    }
}

