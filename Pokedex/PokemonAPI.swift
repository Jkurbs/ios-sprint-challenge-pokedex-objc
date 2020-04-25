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
    
    @objc var pokemons = [POPokemon]()
    
    @objc func fetchAllPokemon(completion: @escaping ([POPokemon]?, Error?) -> Void) {
        
        guard let url = URL(string: BaseURL.general.description) else {
            completion(nil, NetworkError.badURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                NSLog("Error with URL Session: \(error)")
                completion(nil, NetworkError.networkError)
                return
            }
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            
            var dictionary : [String:Any?]
            do {
                dictionary = try (JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] ?? [:])
            } catch let error as NSError {
                completion(nil,error)
                return
            }
            
            guard let resultsArray = dictionary["results"] as? [[String:String]]else { return }
            
            for pokemonDict in resultsArray {
                guard let pokemon = POPokemon(dictionary: pokemonDict) else { return }
                self.pokemons.append(pokemon)
                completion(self.pokemons,nil)
            }
        }.resume()
    }
    
    @objc func fillInDetails(for pokemon: POPokemon) {
        
        var url = URL(string: BaseURL.pokemon.description)
        url?.appendPathComponent(pokemon.name)
        
        URLSession.shared.dataTask(with: url!) {  (data, response, error) in
            
            guard let data = data else { return }
            var topLevelDictionary : [String:Any]?
            do {
                topLevelDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            } catch let err as NSError {
                print(err)
                return
            }
            guard let dict = topLevelDictionary else { return }
            guard let id = dict["id"] as? NSNumber else { return }
            pokemon.identifier  = id
            
            let spritesDictionary = dict["sprites"] as! [String:String?]
            let imageURLString = spritesDictionary["front_default"] as? String
            if let imageURL = URL(string: imageURLString!) {
                guard let data = try? Data(contentsOf: imageURL) else { return }
                pokemon.pokeImage = UIImage(data: data)!
            }

            let abilitiesArray = dict["abilities"] as! [[String:Any]]
            for item in abilitiesArray {
                let ability = item["ability"] as! [String:String]
                let abi = ability["name"]!
                pokemon.abilities.append(abi)
                print("ITEM: \(item)")
            }
            
        }.resume()
    }
}
