//
//  ProfileViewState.swift
//  NestedSwiftUITests
//
//  Created by Markus Faßbender on 20.09.22.
//

import Foundation

enum ProfileViewState {
    case loading
    case content(_ displayModel: ProfileDisplayModel)
}
