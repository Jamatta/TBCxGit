//
//  ListView.swift
//  NYTimes
//
//  Created by Nika Jamatashvili on 03.01.24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel: DailyNewsSceneViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.newsArray, id: \.self) { news in
                newsCell(news)
            }
            .onDelete(perform: viewModel.removeNews)
            .onMove(perform: viewModel.moveNews)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                sortButton()
            }
        }
        .overlay {
            emptyStateCell()
        }
    }
    
    private func newsCell(_ news: News) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Text(news.title)
                    .font(.title3)
                    .bold()
            }
            
            Text(news.description)
                .foregroundStyle(.black.opacity(0.4))
                .font(.body)
        }
    }
    
    private func emptyStateCell() -> some View {
        Group {
            if viewModel.newsArray.isEmpty {
                VStack {
                    Text("There is no any news")
                        .foregroundStyle(.gray.opacity(0.8))
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                                .foregroundColor(.gray.opacity(0.4))
                        )
                }
                .padding()
            }
        }
    }
    
    private func sortButton() -> some View {
        HStack {
            Button("Sort A-Z", action: viewModel.sortByAlphabetically)
            EditButton()
        }
    }
}

#Preview {
    ListView(viewModel: DailyNewsSceneViewModel())
}
