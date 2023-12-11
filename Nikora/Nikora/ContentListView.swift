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
            NavigationStack {
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.groceries) { item in
                            ProductCellView(viewModel: viewModel, product: item)
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 100)
                    .padding(.top, -20)
                    
                }
                .navigationBarItems(trailing:
                                        Button(action: {}) {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "cart.fill")
                            .font(Font.system(size: 22))
                            .foregroundColor(CustomColors.skyBlue)
                            .imageScale(.large)
                            .frame(width: 48, height: 48)
                        
                        GeometryReader { geometry in
                            Text("\(viewModel.cart.count)")
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 22, height: 22)
                                .background(CustomColors.skyBlue)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .offset(x: 24, y: 0)
                        }
                    }
                    .padding(.trailing, 8)
                    
                }
                )
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("ნიკორა")
                            .font(Font.title3.weight(.bold))
                            .foregroundColor(CustomColors.textPrimary)
                    }
                }
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
                    // TODO: Action
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
