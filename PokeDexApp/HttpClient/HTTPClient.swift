//
//  HTTPClient.swift
//  PokeDexApp
//
//  Created by Yermis Beltran on 4/08/21.
//

import Foundation
import UIKit

typealias ServiceResult<Success> = Swift.Result<Success, HTTPClientError>

protocol HTTPClient {
    func request<T: Codable>(url: URLRequest, completion: @escaping (ServiceResult<T>) -> Void)
}

enum HTTPClientError: Error {
    case connectivity
    case serviceError
    case errorParser
    case badURL
}
