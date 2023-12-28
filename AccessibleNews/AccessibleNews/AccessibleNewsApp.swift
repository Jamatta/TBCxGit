//
//  AccessibleNewsApp.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 27.12.23.
//

import SwiftUI

@main
struct AccessibleNewsApp: App {
    
    @State var viewModel = NewsViewModel()
    
    var body: some Scene {
        WindowGroup {
            UITableViewRepresentable(viewModel: NewsViewModel())
        }
    }
}
