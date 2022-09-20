//
//  ModuleViewModel.swift
//  NestedSwiftUITests
//
//  Created by Markus Faßbender on 19.09.22.
//

import Foundation
import Combine

final class ModuleViewModel: ObservableObject {

    private let identifier: String

    @Published var displayModel: ModuleDisplayModel

    init(identifier: String) {
        self.identifier = identifier
        self.displayModel = .init(identifier: identifier)
    }

    func setExternalData(_ number: Int) {
        print("set external data of model \(identifier)")
        displayModel = .init(
            identifier: displayModel.identifier,
            internal: displayModel.internal,
            external: "\(number)",
            isExpanded: displayModel.isExpanded
        )
    }

    private func setInternalData(_ number: Int) {
        print("set internal data of model \(identifier)")
        displayModel = .init(
            identifier: displayModel.identifier,
            internal: "\(number)",
            external: displayModel.external,
            isExpanded: displayModel.isExpanded
        )
    }

    func updateInternal() {
        guard displayModel.internal == nil else {
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.setInternalData(Int.random(in: 0..<1000))
        }
    }

    func toggleExpand() {
        print("toggleExpand of model \(identifier)")
        displayModel.isExpanded.toggle()
    }
}
