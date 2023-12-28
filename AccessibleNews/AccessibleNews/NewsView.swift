//
//  NewsView.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 28.12.23.
//

import SwiftUI

struct NewsView: View {
    
    //MARK: Properties
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(viewModel.Articles.first?.title ?? "")
    }
}

#Preview {
    NewsView(viewModel: NewsViewModel())
}
