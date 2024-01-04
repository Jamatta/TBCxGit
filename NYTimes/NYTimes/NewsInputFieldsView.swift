//
//  ContentView.swift
//  NYTimes
//
//  Created by Nika Jamatashvili on 25.12.23.
//

import SwiftUI

struct NewsInputFieldsView: View {
    
    @ObservedObject var viewModel: DailyNewsSceneViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            TextField("Title", text: $viewModel.title)
                .padding(16)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(.gray.opacity(0.4))
                )
            
            TextEditor(text: $viewModel.description)
                .frame(height: 80)
                .padding(16)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(.gray.opacity(0.4))
                )
                
            DatePicker("Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                .padding(16)
                .background(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(.gray.opacity(0.4))
                )
            
            Button("Save News") {
                
                viewModel.saveNews()
            }
            
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(.gray.opacity(0.12))
            .cornerRadius(8)
                        
        }
        .padding(.top, 24)
        .cornerRadius(16)
    }
}

#Preview {
    NewsInputFieldsView(viewModel: DailyNewsSceneViewModel())
}
