//
//  SplitModuleViewModel.swift
//  NestedSwiftUITests (iOS)
//
//  Created by Markus Faßbender on 21.09.22.
//

import Foundation
import Combine

struct SplitModuleDisplayModel {
    let hitCount: String
}

final class SplitModuleViewModel: ObservableObject {

    let simpleTitle = "Simple Count"
    let complexTitle = "Complex Count"

    @Published var displayModel: SplitModuleDisplayModel

    private var hitCount: Int
    private var cancellables = Set<AnyCancellable>()

    private(set) lazy var unidirectionalCounterViewModel: UnidirectionalCounterViewModel = {
        let viewModel = UnidirectionalCounterViewModel(title: complexTitle)
        viewModel.interactionPublisher
            .sink { [weak self] interaction in
                self?.handleUnidirectionalCounterInteraction(interaction)
            }
            .store(in: &cancellables)
        return viewModel
    }()

    init() {
        self.hitCount = 0
        self.displayModel = Self.makeDisplayModel(hitCount: hitCount)
    }

    func hit() {
        hitCount += 1
        displayModel = Self.makeDisplayModel(hitCount: hitCount)
    }

    private func handleUnidirectionalCounterInteraction(_ interaction: UnidirectionalCounterInteraction) {
        switch interaction {
        case .hit:
            hit()
        }
    }

    private static func makeDisplayModel(hitCount: Int) -> SplitModuleDisplayModel {
        SplitModuleDisplayModel(
            hitCount: "\(hitCount)"
        )
    }
}
