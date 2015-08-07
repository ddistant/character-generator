//
//  SHCharacter.h
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/6/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SHCharacter : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *age;
@property (nonatomic) NSString *abilities;
@property (nonatomic) BOOL *isGood;
@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *bio;
@property (nonatomic) NSString *city;

@end
