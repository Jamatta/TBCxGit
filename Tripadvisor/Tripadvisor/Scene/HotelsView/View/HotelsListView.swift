//
//  HotelsListView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 14.12.23.
//

import SwiftUI

struct HotelsListView: View {
    
    let destination: Destination
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(0..<destination.hotels.count) { index in
                    HotelCellView(hotel: destination.hotels[index])
                }
            }
        }
        .ignoresSafeArea()
        .padding(.horizontal, 24)
        .padding(.top, 8)
        .background(AppColors.backgroundSecondary)
    }
}
