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
            SimpleCounterView(title: "Count A")

            SimpleCounterView(title: "Count B")
        }
        .padding()
        .background(Color.lightRandom())
    }
}

struct SplitModuleView_Previews: PreviewProvider {
    static var previews: some View {
        SplitModuleView(viewModel: SplitModuleViewModel())
    }
}
