//
//  SplitModuleView.swift
//  NestedSwiftUITests
//
//  Created by Markus Faßbender on 21.09.22.
//

import SwiftUI
import Combine

struct SplitModuleView: View {

    @ObservedObject var viewModel: SplitModuleViewModel

    var body: some View {
        HStack {
            SimpleCounterView(title: viewModel.simpleTitle)

            UnidirectionalCounterView(viewModel: viewModel.unidirectionalCounterViewModel)
        }
        .padding()
        .background(Color.lightRandom())
    }
}

struct SplitModuleView_Previews: PreviewProvider {
    private static var viewModel = SplitModuleViewModel()

    static var previews: some View {
        SplitModuleView(viewModel: viewModel)
    }
}
