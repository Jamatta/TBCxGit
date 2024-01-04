//
//  NYTimesApp.swift
//  NYTimes
//
//  Created by Nika Jamatashvili on 25.12.23.
//

import SwiftUI

@main
struct NYTimesApp: App {
    var body: some Scene {
        WindowGroup {
            NewsInputFieldsView(viewModel: DailyNewsSceneViewModel())
        }
    }
}
