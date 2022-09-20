//
//  ModuleView.swift
//  NestedSwiftUITests
//
//  Created by Markus Faßbender on 19.09.22.
//

import SwiftUI
import Combine

struct ModuleView: View {

    @ObservedObject var viewModel: ModuleViewModel

    var body: some View {
        VStack {
            Text("identifier: \(viewModel.displayModel.identifier)")

            Text("internal set data: \(viewModel.displayModel.internal ?? "unset")")

            Text("external set data: \(viewModel.displayModel.external ?? "unset")")

            Button(viewModel.displayModel.isExpanded ? "collapse" : "expand") {
                viewModel.toggleExpand()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: viewModel.displayModel.isExpanded ? 300 : 200)
        .background(Color.lightRandom())
        .onAppear {
            viewModel.updateInternal()
        }
    }
}

struct ModuleViewView_Previews: PreviewProvider {
    static var previews: some View {
        ModuleView(viewModel: ModuleViewModel(identifier: ""))
    }
}
