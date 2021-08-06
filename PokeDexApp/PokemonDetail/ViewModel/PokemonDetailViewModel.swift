//
//  PokemonDetailViewModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 28/06/21.
//

import Foundation
import PKHUD

class PokemonDetailViewModel {
    
    var pokemon: PokemonData!
    var pokemonDetail: PokemonDetail!
    var sprites: [String] = []
    var namePokemon: String = ""
    var didLoadDetail: (() -> Void)?
    
    let repository: APIRepositoryProtocol
    init(repository: APIRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPokemonDetail(name: String,completionHandler: @escaping (PokemonDetailResult) -> Void)
    {
        repository.getDetail(name: name) { pokemonDetail in
            completionHandler(pokemonDetail)
        }
    }
    
    func loadPokemonDetail() {
        HUD.show(.progress)
        if pokemon != nil{
            namePokemon = pokemon.name
        }
        self.getPokemonDetail(name: namePokemon)  { result in
            switch result {
            case .success(let pokemonDetailResult):
                    self.pokemonDetail = pokemonDetailResult
                    DispatchQueue.main.async {
                        self.didLoadDetail?()
                        HUD.hide()
                    }
            case .failure(let error):
                print(error)
            }
        }
    }
}
