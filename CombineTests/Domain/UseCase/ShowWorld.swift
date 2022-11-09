//
//  ShowWorldTime.swift
//  CombineTests
//
//  Created by Olivier Butler on 08/11/2022.
//

import Combine

protocol WorldShowable {
    func showWorld() -> AnyPublisher<World, Never>
}

struct ShowWorldUseCase: WorldShowable {
    let dataSource: TimerDataViewable

    func showWorld() -> AnyPublisher<World, Never> {
        return dataSource.timePublisher
            .map {
                World(incrimentsSinceStartOfUniverse: $0)
            }
            .eraseToAnyPublisher()
    }
}
