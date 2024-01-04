//
//  DailyNewsScene.swift
//  NYTimes
//
//  Created by Nika Jamatashvili on 03.01.24.
//

import SwiftUI

struct DailyNewsScene: View {
    
    @ObservedObject var viewModel = DailyNewsSceneViewModel()
    
    var body: some View {
        NewsInputFieldsView(viewModel: viewModel)
            .padding(16)
        NavigationStack {
            ListView(viewModel: viewModel)
        }
    }
}

#Preview {
    DailyNewsScene()
}
