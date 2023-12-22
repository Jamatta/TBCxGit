//
//  ImageMagnificationView.swift
//  ArtGallery
//
//  Created by Nika Jamatashvili on 23.12.23.
//

import SwiftUI

struct ImageMagnificationView: View {
    
    @State private var scale: CGFloat = 1.0
    
    let imageName: String
    
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 120)
            .clipped()
            .background(.red)
            .scaleEffect(scale)
            .shadow(color: Color.black.opacity(0.28), radius: 1, x: 1, y: 1)
            .shadow(color: Color.black.opacity(0.16), radius: 4, x: 2, y: 2)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        scale = value
                    }
            )
    }
}

struct ImageMagnificationView_Previews: PreviewProvider {
    static var previews: some View {
        ImageMagnificationView(imageName: "image6")
    }
}
