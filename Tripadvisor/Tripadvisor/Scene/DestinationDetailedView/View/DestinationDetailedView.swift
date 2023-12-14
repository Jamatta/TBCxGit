//
//  DestinationDetailedView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 14.12.23.
//

import SwiftUI

struct DestinationDetailedView: View {
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Image(destination.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(destination.name)
                    .font(Font.system(size: 24))
                    .bold()
                    .foregroundColor(AppColors.textPrimary)
                
                Text(destination.description)
                    .font(Font.system(size: 18))
                    .foregroundColor(AppColors.textSecondary)
            }
            
            Spacer()
            
            VStack(spacing: 8) {
                
                NavigationLink(destination: TransportView(transport: destination.transport)) {
                    CustomButtonView(title: "Transport", imageName: "car.fill", BGcolor: AppColors.grey)
                }
                NavigationLink(destination: MustSeePlacesListView(destination: destination)) {
                    CustomButtonView(title: "Must see places", imageName: "building.columns.fill", BGcolor: AppColors.grey)
                }
                NavigationLink(destination: HotelsListView(destination: destination)) {
                    CustomButtonView(title: "Hotels", imageName: "building.2.fill", BGcolor: AppColors.grey)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
        .navigationBarTitle(destination.name, displayMode: .inline)
    }
}

struct CustomButtonView: View {
    let title: String
    let imageName: String
    let BGcolor: Color
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Image(systemName: imageName)
        }
        .padding()
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .background(BGcolor)
        .cornerRadius(8)
    }
}
