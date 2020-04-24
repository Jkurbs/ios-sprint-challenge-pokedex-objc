//
//  POPokemon+NSJSONSerialization.m
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import "POPokemon.h"
#import "POPokemon+NSJSONSerialization.h"

@implementation POPokemon(NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"name"];
    NSNumber *id = dictionary[@"id"];
    NSArray *abilities = dictionary[@"abilities"];

    return [self initWithName:name id: id abilities: abilities];

}

- (NSDictionary *)toDictionary {
    NSDictionary *dictionary = @{
        @"name" : self.name,
        @"id" : self.id,
        @"abilities" : self.abilities
    };
    return dictionary;
}



@end
