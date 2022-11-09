//
//  DataSource.swift
//  CombineTests
//
//  Created by Olivier Butler on 08/11/2022.
//

import Combine
import Foundation

protocol TimerDataViewable {
    var timePublisher: AnyPublisher<Double, Never> { get }
}

class TimerDatabase: TimerDataViewable {
    var timePublisher: AnyPublisher<Double, Never>

    init() {
        let startDate = Date()
        timePublisher = Timer
            .publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .map {
                Double($0.timeIntervalSince(startDate))
            }
            .replaceError(with: 0)
            .eraseToAnyPublisher()
    }
}
