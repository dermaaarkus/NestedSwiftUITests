//
//  ConfigurationModuleViewModel.swift
//  NestedSwiftUITests
//
//  Created by Markus Faßbender on 20.09.22.
//

import Foundation
import Combine

final class ConfigurationModuleViewModel: ObservableObject {

    @Published var displayModel: ConfigurationDisplayModel

    private(set) var configuration: Configuration
    var interactionPublisher = PassthroughSubject<ConfigurationModuleInteraction, Never>()

    init(configuration: Configuration) {
        self.displayModel = Self.makeDisplayModel(from: configuration)
        self.configuration = configuration
    }

    func setShowModule1(_ showModule: Bool) {
        print("setShowModule1: \(showModule)")
        
        configuration.showModule1 = showModule
        displayModel = Self.makeDisplayModel(from: configuration)

        interactionPublisher.send(.updateConfiguration(configuration))
    }

    func setShowOtherModules(_ showOtherModules: Bool) {
        print("setShowOtherModules: \(showOtherModules)")

        configuration.showOtherModules = showOtherModules
        displayModel = Self.makeDisplayModel(from: configuration)
        
        interactionPublisher.send(.updateConfiguration(configuration))
    }

    private static func makeDisplayModel(from configuration: Configuration) -> ConfigurationDisplayModel {
        ConfigurationDisplayModel(
            showModule1: configuration.showModule1,
            showOtherModules: configuration.showOtherModules
        )
    }
}
