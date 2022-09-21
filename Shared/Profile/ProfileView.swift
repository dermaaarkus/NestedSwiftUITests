//
//  ProfileView.swift
//  Shared
//
//  Created by Markus Faßbender on 19.09.22.
//

import SwiftUI
import Combine

struct ProfileView: View {

    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        switch viewModel.viewState {
        case .loading:
            loadingView
                .onAppear {
                    viewModel.update()
                }
        case .content(let displayModel):
            lazyContentView(displayModel)
        }
    }

    @ViewBuilder var loadingView: some View {
        Text("loading...")
    }

    @ViewBuilder func lazyContentView(_ displayModel: ProfileDisplayModel) -> some View {
        ScrollView {
            LazyVStack {
                ConfigurationModuleView(viewModel: viewModel.configurationModelViewModel)

                if displayModel.showModule1 {
                    ModuleView(viewModel: viewModel.model1ViewModel)
                }

                if displayModel.showModule2 {
                    ModuleView(viewModel: viewModel.model2ViewModel)
                }

                if displayModel.showModule3 {
                    ModuleView(viewModel: viewModel.model3ViewModel)
                }

                SplitModuleView(viewModel: viewModel.splitViewModel)

                if displayModel.showOtherModules {
                    ModuleView(viewModel: ModuleViewModel(identifier: "other"))

                    ModuleView(viewModel: ModuleViewModel(identifier: "other"))

                    ModuleView(viewModel: ModuleViewModel(identifier: "other"))

                    ModuleView(viewModel: ModuleViewModel(identifier: "other"))

                    ModuleView(viewModel: ModuleViewModel(identifier: "other"))
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    private static var viewModel = ProfileViewModel()

    static var previews: some View {
        ProfileView(viewModel: viewModel)
    }
}
