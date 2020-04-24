//
//  Enum.swift
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

enum NetworkError: Error {
    case networkError
    case badURL
    case noData
    case decoderError
}

enum BaseURL: String, CustomStringConvertible {
    
    case pokemon
    case abilities
    
    var description: String {
        switch self {
        case .pokemon:
            return "https://pokeapi.co/api/v2/pokemon/"
        case .abilities:
            return "https://pokeapi.co/api/v2/ability/"
        }
    }
}
