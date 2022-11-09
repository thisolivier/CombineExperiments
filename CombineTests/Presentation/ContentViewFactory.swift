//
//  ContentViewFactory.swift
//  CombineTests
//
//  Created by Olivier Butler on 09/11/2022.
//

import Foundation
import SwiftUI

enum ContentViewFactory {
    @MainActor static func makeContentView() -> some View {
        let database = TimerDatabase()
        let showWorldUseCase = ShowWorldUseCase(dataSource: database)
        let viewModel = ContentViewModel(showWorldUseCase: showWorldUseCase)
        return ContentView(viewModel: viewModel)
    }
}
