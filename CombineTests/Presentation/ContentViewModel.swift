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
        useCase.sink { completion in
            self.headerText = "Impossible"
        } receiveValue: { world in
            self.headerText = String(format: "%.2f", world.incrimentsSinceStartOfUniverse)
        }
        .store(in: &disposeBag)
    }
}
