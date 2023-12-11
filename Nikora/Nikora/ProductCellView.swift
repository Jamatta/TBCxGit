//
//  ProductCellView.swift
//  Nikora
//
//  Created by Nika Jamatashvili on 10.12.23.
//

import SwiftUI

struct ProductCellView: View {
    
    @ObservedObject var viewModel: ProductsViewModel
        
    let product: Grocery
    
    var body: some View {
        
        VStack(spacing: 24) {
            HStack(spacing: 16) {
                VStack {
                    Image(systemName: "photo.fill")
                        .font(.system(size: 48))
                        .foregroundColor(CustomColors.textPrimary)
                }
                .frame(width: 104, height: 104)
                .background(CustomColors.backgroundSecondary)
                .cornerRadius(16)
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(product.name)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(CustomColors.textPrimary)
                            Text(product.brandName)
                                .foregroundColor(CustomColors.textTertiary)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        HStack(alignment: .center, spacing: 2) {
                            Text("$")
                                .font(.callout)
                                .foregroundColor(CustomColors.textTertiary)
                            Text("\(product.formattedPrice)")
                                .font(.title3)
                                .bold()
                                .foregroundColor(CustomColors.textPrimary)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 2) {
                            Button(action: {
                                viewModel.removeFromCart(product)
                            }) {
                                Image(systemName: "minus.square.fill")
                                    .foregroundColor(CustomColors.skyBlue)
                                    .font(.title)
                            }
                            .buttonStyle(.plain)
                            
                            VStack {
                                Text("\(product.quantity)")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(CustomColors.textPrimary)
                            }
                            .frame(width: 28)
                            
                            Button(action: {
                                viewModel.addToCart(product)
                                
                                //TODO: Action
                                
                            }) {
                                Image(systemName: "plus.square.fill")
                                    .foregroundColor(CustomColors.skyBlue)
                                    .font(.title)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        .padding(4)
                        .background(CustomColors.backgroundSecondary)
                        .cornerRadius(12)
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
            }
            .padding(16)
            .frame(height: 140)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.24), radius: 28, x: 0, y: 20)
            
        }
    }
}
