//
//  ContentView.swift
//  CombineTests
//
//  Created by Olivier Butler on 08/11/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            Text(viewModel.headerText)
                .padding()
                .font(.title)
            Button("Start World") {
                viewModel.requestStartOfWorld()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let database = TimerDatabase()
        let showWorldUseCase = ShowWorldUseCase(dataSource: database)
        let viewModel = ContentViewModel(showWorldUseCase: showWorldUseCase)
        ContentView(viewModel: viewModel)
    }
}
