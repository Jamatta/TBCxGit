//
//  AccessibleNewsApp.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 27.12.23.
//

import SwiftUI

@main
struct AccessibleNewsApp: App {
    
    var body: some Scene {
        WindowGroup {
            NewsView(viewModel: NewsViewModel())
        }
    }
}
