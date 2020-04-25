//
//  POPokemon.h
//  Pokedex
//
//  Created by Kerby Jean on 4/24/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POAbility.h"

NS_ASSUME_NONNULL_BEGIN

@interface POPokemon : NSObject

@property (nonatomic, copy, readonly )NSString *name;
@property (nonatomic, readwrite)NSNumber *identifier;
@property (nonatomic, readwrite)UIImage *pokeImage;
@property (nonatomic, readwrite, copy)NSArray *abilities;


- (instancetype)initWithName:(NSString *)name;
- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
NS_ASSUME_NONNULL_END
