//
//  Veli_StoreApp.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI

@main
struct Veli_StoreApp: App {
    @State var viewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
