//
//  UnidirectionalCounterViewModel.swift
//  NestedSwiftUITests (iOS)
//
//  Created by Markus Faßbender on 21.09.22.
//

import Foundation
import Combine

final class UnidirectionalCounterViewModel: ObservableObject {

    @Published var displayModel: UnidirectionalCounterDisplayModel

    let interactionPublisher = PassthroughSubject<UnidirectionalCounterInteraction, Never>()

    private let title: String
    private var count: Int

    init(title: String) {
        self.title = title
        self.count = 0
        self.displayModel = Self.makeDisplayModel(title: title, count: count)
    }

    func increase() {
        count += 1
        interactionPublisher.send(.hit)

        updateDisplayModel()
    }

    func decrease() {
        count -= 1
        interactionPublisher.send(.hit)

        updateDisplayModel()
    }

    func updateDisplayModel() {
        displayModel = Self.makeDisplayModel(title: title, count: count)
    }

    private static func makeDisplayModel(title: String, count: Int) -> UnidirectionalCounterDisplayModel {
        UnidirectionalCounterDisplayModel(
            title: title,
            count: "\(count)"
        )
    }
}
