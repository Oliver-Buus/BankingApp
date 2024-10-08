//
//  BankingAppApp.swift
//  BankingApp
//
//  Created by dmu mac 24 on 11/09/2024.
//

import SwiftUI

@main
struct BankingAppApp: App {
    @State private var viewModel = StateController()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(viewModel)
        }
    }
}
