//
//  POPokemon+NSJSONSerialization.h
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NPTArtist;

@interface POPokemon_NSJSONSerialization : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end


