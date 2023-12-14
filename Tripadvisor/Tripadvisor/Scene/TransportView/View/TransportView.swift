//
//  TransportView.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 14.12.23.
//

import SwiftUI

struct TransportView: View {
    
    let transport: Transport
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 24) {
            Image(transport.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(transport.name)
                    .font(Font.system(size: 24))
                    .bold()
                    .foregroundColor(AppColors.textPrimary)
                
                Text(transport.description)
                    .font(Font.system(size: 18))
                    .foregroundColor(AppColors.textSecondary)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
        .navigationBarTitle("Transport", displayMode: .inline)
    }
}

