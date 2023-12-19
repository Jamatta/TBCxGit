//
//  HomeScreenView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 13.12.23.
//

import SwiftUI

struct HomeScreenView: View {
    
    @ObservedObject var viewModel = dataView()
    @ObservedObject var tipsModel = TravelTipsViewModel()
    @State private var showAlert = false
    @State private var randomTip = ""
    @State private var navPath = [Int]()
    
    
    var body: some View {
        
        NavigationStack(path: $navPath) {
            ZStack(alignment: .bottom) {
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 12),
                        GridItem(.flexible(), spacing: 12)
                    ], spacing: 12) {
                        ForEach(0..<viewModel.destinations.count) { index in
                            NavigationLink(destination: DestinationDetailedView(destination: viewModel.destinations[index])) {
                                DestinationCardView(destination: viewModel.destinations[index])
                            }
                        }
                    }
                    .padding(16)
                    
                }
                .background(AppColors.backgroundSecondary)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Image("logo"), trailing: EmptyView())
                
                VStack {
                    CustomButtonView(title: "Traveling tips", imageName: "lightbulb.fill", BGcolor: AppColors.green)
                        .onTapGesture {
                            randomTip = tipsModel.displayRandomTip()
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert (
                                title: Text("Random Travel Tip"),
                                message: Text(randomTip),
                                dismissButton: .default(Text("Got it"))
                            )
                        }
                }
                .padding(24)
                .background(AppColors.backgroundPrimary)
                .frame(maxWidth: .infinity, alignment: .bottom)
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
