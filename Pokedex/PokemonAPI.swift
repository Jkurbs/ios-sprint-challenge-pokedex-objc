//
//  PokemonAPI.swift
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class PokemonAPI: NSObject {

    @objc(sharedController) static let shared = PokemonAPI()
    
    var pokemons = [POPokemon]()
    
    init() {
        
        
    }
    
    
    
    
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
                
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let name = dictionary?["name"] as? String
                    let id = dictionary?["id"] as? NSNumber
                    let pokemon = POPokemon(name: name, id: id)
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }

    @objc func fillInDetails(for pokemon: POPokemon) {
        
    }
}
