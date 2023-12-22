//
//  ImageRotationView.swift
//  ArtGallery
//
//  Created by Nika Jamatashvili on 22.12.23.
//

import SwiftUI

struct ImageRotationView: View {
    
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    let imageName: String
    
    var body: some View {
 
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 120)
                .clipped()
                .background(.red)
                .shadow(color: Color.black.opacity(0.28), radius: 1, x: 1, y: 1)
                .shadow(color: Color.black.opacity(0.16), radius: 4, x: 2, y: 2)
                .rotationEffect(currentAmount + finalAmount)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            currentAmount = angle
                        }
                        .onEnded { angle in
                            finalAmount += currentAmount
                            currentAmount = .zero
                        }
                )
        } 
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRotationView(imageName: "image3")
    }
}

