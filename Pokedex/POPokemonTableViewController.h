//
//  PokemonViewController.h
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokedex-Swift.h"

@interface POPokemonTableViewController : UITableViewController

@property PokemonAPI *controller;

@property NSMutableArray *pokemons;

@end


