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

@property (weak, nonatomic) IBOutlet UISegmentedControl *goodOrEvilControl;
@property (weak, nonatomic) IBOutlet UITextField *bioTextField;

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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}
- (IBAction)finishedQuiz:(id)sender {
    SHCharacter *character = [[SHCharacter alloc ]init];
    character.name = self.nameTextField.text;
    character.age = self.ageTextField.text;
    character.abilities = self.power;
    character.bio = self.bioTextField.text;
    character.city = self.origin;
    
    
    
    [[CharacterManager sharedCharacterManager].characters addObject:character];
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
    return self.originArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component {
    
    if (pickerView == self.powerPicker) {
        
        return [self.powerArray objectAtIndex:row];
    }
    else if (pickerView == self.originPicker) {
        
        return [self.originArray objectAtIndex:row];
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component {
    if (pickerView == self.powerPicker) {
        self.power = [self.powerArray objectAtIndex:row];
        
    }
    else if (pickerView == self.originPicker) {
        
        self.origin = [self.originArray objectAtIndex:row];
        // second picker stuff
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
