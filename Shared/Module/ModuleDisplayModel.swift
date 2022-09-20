//
//  ModuleDisplayModel.swift
//  NestedSwiftUITests
//
//  Created by Markus Faßbender on 20.09.22.
//

import Foundation

struct ModuleDisplayModel {
    let identifier: String

    let `internal`: String?
    var external: String?

    var isExpanded: Bool

    init(
        identifier: String,
        internal: String? = nil,
        external: String? = nil,
        isExpanded: Bool = false
    ) {
        self.identifier = identifier
        self.internal = `internal`
        self.external = external
        self.isExpanded = isExpanded
    }
}
