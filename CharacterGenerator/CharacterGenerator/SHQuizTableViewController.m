//
//  SHQuizTableViewController.m
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/2/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "SHQuizTableViewController.h"

@interface SHQuizTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *isGoodSegementedControl;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *characterButtons;


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
    self.powerPicker.dataSource = self;
    self.powerPicker.delegate = self;
    self.originPicker.dataSource = self;
    self.originPicker.delegate = self;
    
    
}

- (IBAction)doneButtonTapped:(id)sender {
    
    SHCharacter *character = [[SHCharacter alloc]init];
    
    character.image = self.characterImage;
    character.name = self.nameTextField.text;
    character.power = self.power;
    character.city = self.origin;
    character.age = self.ageTextField.text;
    character.isGood = self.characterIsGood;
    character.bio = self.bioTextView.text;
    
    
    [[CharacterManager sharedCharacterManager].characters addObject:character];

    
    
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
    
    
    
    if (self.isGoodSegementedControl == 0) {
        
         self.characterIsGood = YES;
        
    } else {
        
         self.characterIsGood = NO;
    }
    }

- (IBAction)characterButtonTapped:(UIButton *)sender {
    NSArray *characters = @[@"Character 1-F",
                            @"Character 2-F",
                            @"Character 3-F",
                            @"Character 4-F",
                            @"Character 5-F",
                            @"Character 6-M",
                            @"Character 7-M",
                            @"Character 8-M",
                            @"Character 9-M",
                            @"Character 10-M"
                            
                            ];
    NSInteger index = [self.characterButtons indexOfObject:sender];
    self.characterImage = [UIImage imageNamed:characters[index]];
    
    
    
    
}



@end
