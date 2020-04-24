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

    [self.controller fetchAllPokemonWithCompletion:^(NSArray<POPokemon *> *pokemon, NSError *error) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}


- (IBAction)addPressed:(UIBarButtonItem *)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

}



@end
