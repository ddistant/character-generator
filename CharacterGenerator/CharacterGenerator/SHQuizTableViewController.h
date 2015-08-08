//
//  SHQuizTableViewController.h
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/2/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterManager.h"
#import "SHCharacter.h"


@interface SHQuizTableViewController : UITableViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *powerPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *originPicker;
@property (strong, nonatomic) NSArray *powerArray;
@property (strong, nonatomic) NSArray *originArray;
@property (nonatomic) NSString *power;
@property (nonatomic) NSString *origin;
@property (nonatomic) BOOL characterIsGood;

@property (nonatomic) UIImage *characterImage;

@end
