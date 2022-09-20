//
//  NestedSwiftUITestsApp.swift
//  Shared
//
//  Created by Markus Faßbender on 19.09.22.
//

import SwiftUI

@main
struct NestedSwiftUITestsApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileView(viewModel: ProfileViewModel())
        }
    }
}
