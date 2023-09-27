//
//  DogRequest.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

protocol DogRequestProtocol: GenericRequestProtocol {
    func fetchDog(completion: @escaping completion<Dog?>)
}

class DogRequest: GenericRequest, DogRequestProtocol {
    
    func fetchDog(completion: @escaping completion<Dog?>) {
        do {
            guard let url = try DogRouter.dog.asUrlRequest() else {
                return completion(nil, error)
            }
            request(urlRequest: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
}
