//
//  SHQuizTableViewController.m
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/2/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "SHQuizTableViewController.h"
#import "CharacterManager.h"
#import "SHCharacter.h"

@interface SHQuizTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *isGoodSegementedControl;


@end

@implementation SHQuizTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originArray = @[@"San Francisco",
                         @"New York City",
                         @"Los Angeles",
                         @"Boston",
                         @"Tel Aviv",
                         @"London",
                         @"Chicago",
                         @"Seattle",
                         @"Berlin",
                         @"Singapore"];
    self.powerArray = @[
                        @"Super-Strength",
                        @"Super-Speed",
                        @"Laser Vision",
                        @"Stretchiness",
                        @"Shape-Shifting",
                        @"Pyrokinesis",
                        @"Electrokinesis",
                        @"Teleportation",
                        @"Mike",
                        @"Water Bending"
                        ];
    
    
}

- (IBAction)doneButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
    return self.originArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if ([pickerView isEqual: self.powerPicker]) {
        
        return [self.powerArray objectAtIndex:row];
    }
    else if ([pickerView isEqual: self.originPicker]) {
        
        return [self.originArray objectAtIndex:row];
    }
    
    return [self.originArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([pickerView isEqual: self.powerPicker]) {
        
        self.power = [self.powerArray objectAtIndex:row];
        
    }
    else if ([pickerView isEqual: self.originPicker]) {
        
        self.origin = [self.originArray objectAtIndex:row];

    }
}
- (IBAction)isGoodSegmentedControlChanged:(id)sender {
    
    SHCharacter *character = [[SHCharacter alloc] init];
    
    if (self.isGoodSegementedControl == 0) {
        
        character.isGood = YES;
        
    } else {
        
        character.isGood = NO;
    }
}



@end
