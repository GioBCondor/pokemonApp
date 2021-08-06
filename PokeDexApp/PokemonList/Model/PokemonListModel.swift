//
//  PokemonListModel.swift
//  PokeDexApp
//
//  Created by YERMIS.BELTRAN on 27/06/21.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonData]
    
}

struct PokemonData: Codable {
    var url:String?
    var name:String
}
