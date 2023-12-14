//
//  MustSeePlacesListView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 14.12.23.
//

import SwiftUI

struct MustSeePlacesListView: View {
    
    let destination: Destination
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(0..<destination.mustSeePlaces.count) { index in
                    MustSeePlaceCellView(mustSeePlace: destination.mustSeePlaces[index])
                }
            }
        }
        .ignoresSafeArea()
        .padding(.horizontal, 24)
        .padding(.top, 8)
        .background(AppColors.backgroundSecondary)
    }
}
