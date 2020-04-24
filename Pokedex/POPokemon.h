//
//  POPokemon.h
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface POPokemon : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSNumber *id;
@property (nonatomic, readonly) NSArray *abilities;

- (instancetype)initWithName:(NSString *)name id:(NSNumber *)id abilities:(NSArray *)abilities;

@end
