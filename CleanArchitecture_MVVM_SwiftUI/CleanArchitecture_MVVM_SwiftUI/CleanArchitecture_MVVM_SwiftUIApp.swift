//
//  CleanArchitecture_MVVM_SwiftUIApp.swift
//  CleanArchitecture_MVVM_SwiftUI
//
//  Created by NK on 26/02/26.
//

import SwiftUI

@main
struct CleanArchitecture_MVVM_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: AppDependencies.shared.makeMoviesViewModel())
        }
    }
}
