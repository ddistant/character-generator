//
//  CharacterManager.m
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/6/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "CharacterManager.h"

@implementation CharacterManager : NSObject

static CharacterManager *sharedCharacterManager = nil;

+ (CharacterManager *)sharedCharacterManager {
    static CharacterManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        sharedManager.characters = [[NSMutableArray alloc] init];
    });
    return sharedManager;
}


@end
