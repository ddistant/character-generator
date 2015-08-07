//
//  CharacterManager.h
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/6/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CharacterManager : NSObject

@property (nonatomic) NSMutableArray *characters;

+ (CharacterManager *) sharedCharacterManager;

@end
