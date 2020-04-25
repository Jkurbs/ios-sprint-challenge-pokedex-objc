//
//  POAbility.m
//  Pokedex
//
//  Created by Kerby Jean on 4/25/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import "POAbility.h"

@implementation POAbility 

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = [name copy];
    }
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"name"];
    if (!name) { return nil; }
    return [self initWithName:name];
}

@end
