//
//  PokemonViewController.m
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POPokemonTableViewController.h"
#import "Pokedex-Swift.h"
#import "POPokemon.h"

@interface POPokemonTableViewController ()

@end

@implementation POPokemonTableViewController : UITableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[PokemonAPI alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [PokemonAPI.sharedController fetchAllPokemonWithCompletion:^(NSArray<POPokemon *> *pokemons, NSError *error) {
        if (error) {
            NSLog(@"Error fetching all pokemon");
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.pokemons = [pokemons mutableCopy];
                [self.tableView reloadData];
            });
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (IBAction)addPressed:(UIBarButtonItem *)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemons.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"POPokeCell" forIndexPath:indexPath];
    POPokemon *pokemon = self.pokemons[indexPath.row];
    cell.textLabel.text = pokemon.name;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
