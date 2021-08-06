//
//  APIRepository.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation

typealias PokemonListResult = ServiceResult<PokemonList>
typealias PokemonDetailResult = ServiceResult<PokemonDetail>

protocol APIRepositoryProtocol {
    
    func getList(page: Int, completionHandler: @escaping (PokemonListResult) -> Void)
    func getDetail(name: String?, completionHandler: @escaping (PokemonDetailResult) -> Void)
    func getRandomPokemon(id: Int?, completionHandler: @escaping (PokemonDetailResult) -> Void)
}

class APIRepository: APIRepositoryProtocol {
    
    private let limit = Constants.Pagination.limit
    
    var httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getList(page: Int, completionHandler: @escaping (PokemonListResult) -> Void) {
        guard let url = URL(string: Constants.Url.pokemonList) else { return }
            let urlRequest = URLRequest(url: url)
            httpClient.request(url: urlRequest, completion: completionHandler)
    }
    
    func getDetail(name: String?, completionHandler: @escaping (PokemonDetailResult) -> Void) {
        guard let url = URL(string: Constants.Url.pokemonList + "\(name!)") else { return }
            let urlRequest = URLRequest(url: url)
            httpClient.request(url: urlRequest, completion: completionHandler)
    }
    
    func getRandomPokemon(id: Int?, completionHandler: @escaping (PokemonDetailResult) -> Void) {
         
        guard let url = URL(string: Constants.Url.pokemonList + "\(id!)") else { return }
            let urlRequest = URLRequest(url: url)
            httpClient.request(url: urlRequest, completion: completionHandler)
     }
}




