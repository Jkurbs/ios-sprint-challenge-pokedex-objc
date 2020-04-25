//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Kerby Jean on 4/25/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    @objc var id: NSNumber?
    
    @objc var pokemon: POPokemon?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    
    var imageObservation: NSKeyValueObservation?
    var idObservation: NSKeyValueObservation?
    var abilitiesObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        addObservers()
        
        if (pokemon?.identifier == nil ||  pokemon?.abilities == nil ||  pokemon?.pokeImage == nil) {
            if let pokemon = pokemon { PokemonAPI.shared.fillInDetails(for: pokemon) }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeObservers()
    }
    
    private func updateViews() {
        if let pokemon = pokemon {
            nameLabel.text = pokemon.name
            imageView.image = pokemon.pokeImage
            idLabel.text = "ID: \(pokemon.identifier)"
            let abilities = pokemon.abilities as? [String]
            abilityLabel.text = "Abilities: \(String(describing: abilities!.joined(separator: ", "))) "
        }
    }
    
    
    private func addObservers() {
        let observerChangeHandler: ((Any, Any) -> Void) = { [weak self] _, _ in
            guard let self = self else { return }
            DispatchQueue.main.async {  self.updateViews()   }
        }
        
        imageObservation = observe(\.pokemon?.pokeImage, changeHandler: observerChangeHandler)
        idObservation = observe(\.pokemon?.identifier, changeHandler: observerChangeHandler)
        abilitiesObservation = observe(\.pokemon?.abilities, changeHandler: observerChangeHandler)
    }
    
    
    private func removeObservers() {
        imageObservation = nil
        idObservation = nil
        abilitiesObservation = nil
    }
}
