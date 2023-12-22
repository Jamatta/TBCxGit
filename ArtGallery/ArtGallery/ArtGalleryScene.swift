//
//  ArtGalleryScene.swift
//  ArtGallery
//
//  Created by Nika Jamatashvili on 22.12.23.
//

import SwiftUI

struct ArtGalleryScene: View {
    
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    @State private var showInstructions = false

    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
            
            VStack(spacing: 60) {
                
                HStack(spacing: 80) {
                    ImageRotationView(imageName: "image1")
                    ImageRotationView(imageName: "image2")
                }
                
                HStack(spacing: 80) {
                    ImageDragView(imageName: "image3")
                    ImageDragView(imageName: "image4")
                }
                
                HStack(spacing: 80) {
                    ImageMagnificationView(imageName: "image5")
                    ImageMagnificationView(imageName: "image6")
                }
                
            }
            .padding(.horizontal, 80)
            .padding(.vertical, 40)
            
            Button("Instructions") {
                showInstructions.toggle()
            }
            .foregroundColor(.black.opacity(0.8))
            .bold()
            .padding(.top, 700)
            .sheet(isPresented: $showInstructions) {
                InstructionView()
            }
        }
        .ignoresSafeArea()
    }
}

struct ArtGalleryScene_Previews: PreviewProvider {
    static var previews: some View {
        ArtGalleryScene()
    }
}
