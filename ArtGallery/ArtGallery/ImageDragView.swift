//
//  ImageDragView.swift
//  ArtGallery
//
//  Created by Nika Jamatashvili on 23.12.23.
//

import SwiftUI

struct ImageDragView: View {
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    let imageName: String
 
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }

        let combined = pressGesture.sequenced(before: dragGesture)
        
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 120)
            .clipped()
            .background(.red)
            .shadow(color: Color.black.opacity(0.28), radius: 1, x: 1, y: 1)
            .shadow(color: Color.black.opacity(0.16), radius: 4, x: 2, y: 2)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct ImageDragView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDragView(imageName: "image2")
    }
}

