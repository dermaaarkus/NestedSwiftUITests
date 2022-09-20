//
//  ConfigurationModuleView.swift
//  NestedSwiftUITests
//
//  Created by Markus Faßbender on 20.09.22.
//

import SwiftUI
import Combine

struct ConfigurationModuleView: View {

    @ObservedObject var viewModel: ConfigurationModuleViewModel

    var body: some View {
        Toggle("Show Module 1", isOn: .init(get: {
            viewModel.displayModel.showModule1
        }, set: {
            viewModel.setShowModule1($0)
        }))
        .padding()

        Toggle("Show Other Modules", isOn: .init(get: {
            viewModel.displayModel.showOtherModules
        }, set: {
            viewModel.setShowOtherModules($0)
        }))
        .padding()
    }
}

struct ConfigurationModuleView_Previews: PreviewProvider {
    private static var viewModel = ConfigurationModuleViewModel(configuration: Configuration())

    static var previews: some View {
        ConfigurationModuleView(viewModel: viewModel)
    }
}
