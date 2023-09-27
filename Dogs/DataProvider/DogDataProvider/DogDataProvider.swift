//
//  DogDataProvider.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation
import Combine

class DogDataProvider {
    
    private let dogRequest: DogRequest?
    
    init(dogRequest: DogRequest = DogRequest()) {
        self.dogRequest = dogRequest
    }
    
    func fetchDog() -> AnyPublisher<Dog, Error> {
        return Future { promise in
            self.dogRequest?.fetchDog(completion: { result, failure in
                if let failure = failure {
                    promise(.failure(failure))
                }
                guard let dog = result else { return }
                return promise(.success(dog))
            })
        }.eraseToAnyPublisher()
    }
}
