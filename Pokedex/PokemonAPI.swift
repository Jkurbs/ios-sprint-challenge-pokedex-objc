//
//  PokemonAPI.swift
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

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

class PokemonAPI: NSObject {

    @objc(sharedController) static let shared = PokemonAPI()

    @objc func fetchAllPokemon(completion: @escaping ([POPokemon]?, Error?) -> Void) {
        
        var id = 0
        for _ in 1...700 {
            id += 1
            guard let url = URL(string: BaseURL.pokemon.description) else {
                completion(nil, NetworkError.badURL)
                return
            }
            let idEndpoint = url.appendingPathComponent(String(id))
            let request = URLRequest(url: idEndpoint)
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    NSLog("Error with URL Session: \(error)")
                    completion(nil, NetworkError.networkError)
                    return
                }
                guard let data = data else {
                    completion(nil, NetworkError.noData)
                    return
                }
                
                print("DATA RETURNED: \(data)")
                
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print("NAME:: \(dictionary?["name"] as! String)")
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }

    @objc func fillInDetails(for pokemon: POPokemon) {
        
    }
}
