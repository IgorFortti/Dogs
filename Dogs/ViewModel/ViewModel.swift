//
//  ViewModel.swift
//  Dogs
//
//  Created by Igor Fortti on 27/09/23.
//

import Foundation
import SwiftUI
import Combine

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        enum ViewState {
            case start
            case loading
            case success
            case failure
        }
        
        @Published var dog: Dog?
        
        @Published var currentState: ViewState = .start
        
        private let dataProvider: DogDataProvider?
        private var cancelables = Set<AnyCancellable>()
        
        init(dataProvider: DogDataProvider = DogDataProvider()) {
            self.dataProvider = dataProvider
        }
        
        func doFetchDog() {
            currentState = .loading
            dataProvider?.fetchDog()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.currentState = .success
                case .failure(_):
                    self.currentState = .failure
                }
            }, receiveValue: { dog in
                self.dog = dog
                debugPrint("%%%%\(dog.message)")
            }).store(in: &cancelables)
        }
    }
}
