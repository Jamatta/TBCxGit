//
//  ContentListView.swift
//  Nikora
//
//  Created by Nika Jamatashvili on 10.12.23.
//

import SwiftUI

struct ContentListView: View {
    
    @ObservedObject var viewModel = ProductsViewModel()
    @State private var isSaleOn = false
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.groceries) { item in
                        ProductCellView(viewModel: viewModel, product: item)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 100)
                .padding(.top, 32)
                
            }  
            .onTapGesture {
            }
            
            VStack {
                VStack {
                    Toggle("20% Sale", isOn: $isSaleOn)
                        .font(.title3)
                        .bold()
                        .foregroundColor(CustomColors.textPrimary)
                        .onChange(of: isSaleOn) { newValue in
                            viewModel.applySale(newValue)
                        }
                }
                .background(Color.white)
                .frame(height: 64)
                
                Button(action: {
                    viewModel.testClick()
                }) {
                    HStack {
                        HStack(alignment: .center) {
                            Text("Checkout")
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.leading, 32)
                        
                        Image(systemName: "cart.fill")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(24)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .background(CustomColors.lightBlue)
                .cornerRadius(20)
                
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            
        }
        .background(CustomColors.backgroundSecondary)
        .environmentObject(viewModel)
        
    }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
