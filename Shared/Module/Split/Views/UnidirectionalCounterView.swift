//
//  UnidirectionalCounterView.swift
//  NestedSwiftUITests (iOS)
//
//  Created by Markus Faßbender on 21.09.22.
//

import SwiftUI

struct UnidirectionalCounterView: View {

    @ObservedObject var viewModel: UnidirectionalCounterViewModel

    var body: some View {
        VStack {
            Text(viewModel.displayModel.title)

            Stepper(viewModel.displayModel.count) {
                viewModel.increase()
            } onDecrement: {
                viewModel.decrease()
            }
        }
        .padding()
        .background(Color.lightRandom())
    }
}

struct UnidirectionalCounterView_Previews: PreviewProvider {
    private static var viewModel = UnidirectionalCounterViewModel(title: "Preview")

    static var previews: some View {
        UnidirectionalCounterView(viewModel: viewModel)
    }
}

