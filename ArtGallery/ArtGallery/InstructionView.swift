//
//  InstructionView.swift
//  ArtGallery
//
//  Created by Nika Jamatashvili on 23.12.23.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("First Row: Rotation Gesture")
                    .font(.headline)
                Text("Images in this row support rotation gestures.")
                    .font(.body)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Second Row: Long Press + Drag & Move Gestures")
                    .font(.headline)
                Text("Images in this row support long press, drag, and move gestures.")
                    .font(.body)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Third Row: Magnification Gesture")
                    .font(.headline)
                Text("Images in this row support magnification gestures.")
                    .font(.body)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(24)
    }
}


struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
