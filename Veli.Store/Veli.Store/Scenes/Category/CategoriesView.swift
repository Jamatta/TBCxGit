//
//  CategoriesView.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var viewModel: CategoriesListModel
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderComponentView(viewmodel: HeaderViewModel())
                List(viewModel.categoriesArray, id: \.self) { category in
                    NavigationLink(destination: CategoryListView(categoryName: category, viewModel: CategoriesListModel())) {
                        Text(category)
                            .font(Font.system(size: 16))
                            .bold()
                            .foregroundColor(AppColors.textPrimary)
                            .padding(.vertical, 10)
                    }
                }
                .listStyle(.plain)
                .background(Color.white)
            }
        }
    }
}

