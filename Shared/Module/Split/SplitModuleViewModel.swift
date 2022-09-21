//
//  SplitModuleViewModel.swift
//  NestedSwiftUITests (iOS)
//
//  Created by Markus Faßbender on 21.09.22.
//

import Foundation

final class SplitModuleViewModel: ObservableObject {

    let simpleTitle = "Simple Count"
    let complexTitle = "Complex Count"

    private(set) lazy var unidirectionalCounterViewModel = UnidirectionalCounterViewModel(title: complexTitle)
}
