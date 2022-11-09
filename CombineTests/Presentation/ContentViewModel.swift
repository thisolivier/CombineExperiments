//
//  ContentViewModel.swift
//  CombineTests
//
//  Created by Olivier Butler on 09/11/2022.
//

import Foundation
import Combine

@MainActor
class ContentViewModel: ObservableObject {

    @Published var headerText: String = "Waiting"
    @Published var startButtonVisible: Bool = true
    private var disposeBag = Set<AnyCancellable>()
    private var useCase: AnyPublisher<World, Never>

    init(showWorldUseCase: WorldShowable) {
        useCase = showWorldUseCase.showWorld()
    }

    func requestStartOfWorld() {
        startButtonVisible = false
        useCase.sink { completion in
            self.headerText = "Impossible"
        } receiveValue: { world in
            self.headerText = self.formatWorldAge(world.incrimentsSinceStartOfUniverse)
        }
        .store(in: &disposeBag)
    }

    func formatWorldAge(_ age: Double) -> String {
        let emoji: String = {
            if age < 10 {
                return "🌱"
            } else if age < 20 {
                return "🌿"
            } else {
                return "🌳"
            }
        }()
        return String(format: "%.2f", age) + " seconds old " + emoji
    }
}
