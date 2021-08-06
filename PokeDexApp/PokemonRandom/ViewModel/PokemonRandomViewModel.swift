//
//  PokemonRandomViewModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 29/06/21.
//

import Foundation
import PKHUD

class PokemonRandomViewModel {

    var id: Int = 0
    var pokemon: PokemonDetail!
    let repository: APIRepositoryProtocol
    var didLoadRandom: (() -> Void)?
    
    init(repository: APIRepositoryProtocol) {
        self.repository = repository
    }
    
    func getRandomPokemon(id: Int, completionHandler: @escaping (PokemonDetailResult) -> Void) {
        repository.getRandomPokemon(id: id) { pokemonDetail in
            completionHandler(pokemonDetail)
        }
    }
    
    func loadRandomPokemon() {
        let randomInt = Int.random(in: 1..<898)
        self.getRandomPokemon(id: randomInt) { result in
            switch result {
            case .success(let pokemonDetailResult):
                DispatchQueue.main.async {
                    self.id = randomInt
                    self.pokemon = pokemonDetailResult
                    self.didLoadRandom?()
                    HUD.hide()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    /*func loadRandomPokemon() {
        self.getRandomPokemon(id: randomInt) { pokemonDetail in
            DispatchQueue.main.async {
                self.id = randomInt
                self.pokemon = pokemonDetail
                self.randomCollectionView.reloadData()
                HUD.hide()
            }
        }
    }*/
}

