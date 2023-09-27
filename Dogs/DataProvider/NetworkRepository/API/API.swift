//
//  API.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct API {
    
    static let baseUrl = "https://dog.ceo/api/breeds/image/random"
}
