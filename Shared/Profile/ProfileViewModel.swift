import Foundation
import Combine


final class ProfileViewModel: ObservableObject {

    @Published var viewState: ProfileViewState

    let configurationModelViewModel: ConfigurationModuleViewModel

    let model1ViewModel = ModuleViewModel(identifier: "1")
    let model2ViewModel = ModuleViewModel(identifier: "2")
    let model3ViewModel = ModuleViewModel(identifier: "3")

    private var cancellables = Set<AnyCancellable>()

    init() {
        viewState = .loading

        let defaultConfiguration = Configuration()
        configurationModelViewModel = ConfigurationModuleViewModel(configuration: defaultConfiguration)

        setup()
    }

    private func setup() {
        configurationModelViewModel.interactionPublisher
            .sink { [weak self] interaction in
                guard let self = self else { return }

                switch interaction {
                case .updateConfiguration(let configuration):
                    let displayModel = self.makeDisplayModel(from: configuration)
                    self.viewState = .content(displayModel)
                }
            }
            .store(in: &cancellables)
    }

    func update() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            print("update view state to 'content'")
            let configuration = self.configurationModelViewModel.configuration
            self.viewState = .content(self.makeDisplayModel(from: configuration))

            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                print("update module view models")
                self.model1ViewModel.setExternalData(Int.random(in: 0..<1000))
                self.model2ViewModel.setExternalData(Int.random(in: 0..<1000))
                self.model3ViewModel.setExternalData(Int.random(in: 0..<1000))
            }
        }
    }

    private func makeDisplayModel(from configuration: Configuration) -> ProfileDisplayModel {
        .init(
            showModule1: configuration.showModule1,
            showModule2: true,
            showModule3: true,
            showOtherModules: configuration.showOtherModules
        )
    }
}
