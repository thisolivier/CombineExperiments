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
            Text("The World Is...")
            Text(viewModel.headerText)
                .padding(.bottom, 10)
                .font(.title)
            startWorldButton(viewModel.startButtonVisible)
        }
    }

    @ViewBuilder
    func startWorldButton(_ showButton: Bool) -> some View {
        if showButton {
            Button("Start World") {
                viewModel.requestStartOfWorld()
            }
        } else {
            EmptyView()
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
