//
//  POAbility.h
//  Pokedex
//
//  Created by Kerby Jean on 4/25/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface POAbility : NSObject

@property (nonatomic, readonly, copy) NSString *name;
- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

//NSArray<POAbility *>* )abilities
@end

NS_ASSUME_NONNULL_END
