//
//  SHDetailViewController.h
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/2/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SHDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailBioLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailAgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailPowerLabel;

@end
