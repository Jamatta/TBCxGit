//
//  TestView.swift
//  ArtGallery
//
//  Created by Nika Jamatashvili on 22.12.23.
//

import SwiftUI

struct ContentViewWW: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    @State private var scale: CGFloat = 1.0
    @State private var isDragging = false

    var body: some View {
        Image(systemName: "photo.fill") // Replace with your image
            .resizable()
            .frame(width: 100, height: 100)
            .rotationEffect(currentAmount + finalAmount)
            .scaleEffect(scale)
            .offset(y: isDragging ? -50 : 0)
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
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        scale = value
                    }
                    .onEnded { value in
                        scale = 1.0
                    }
            )
            .gesture(
                DragGesture()
                    .onChanged { _ in
                        isDragging = true
                    }
                    .onEnded { _ in
                        isDragging = false
                    }
            )
    }
}

struct ContentViewWW_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWW()
    }
}

