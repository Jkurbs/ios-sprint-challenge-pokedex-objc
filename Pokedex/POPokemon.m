//
//  POPokemon.m
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import "POPokemon.h"

@implementation POPokemon

- (instancetype)initWithName:(NSString *)name id:(NSNumber *)id {
    self = [super init];
    if (self) {
        _name = name;
        _id = id;
    }
    return self;
}


@end
