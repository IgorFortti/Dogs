//
//  DogRouter.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

enum DogRouter {
    
    case dog
    
    var path: String {
        switch self {
        case .dog:
            return API.baseUrl
        }
    }
    
    func asUrlRequest() throws -> URLRequest? {
        guard let url = URL(string: path) else { return nil }
        let urlRequest = URLRequest(url: url)
        switch self {
        case .dog:
            return urlRequest
        }
    }
}
