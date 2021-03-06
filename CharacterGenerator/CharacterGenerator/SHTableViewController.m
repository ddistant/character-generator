//
//  SHTableViewController.m
//  CharacterGenerator
//
//  Created by Daniel Distant on 8/2/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "SHTableViewController.h"
#import "CharacterManager.h"
#import "SHCharacter.h"
#import "SHDetailViewController.h"

@interface SHTableViewController ()

@end

@implementation SHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    return [CharacterManager sharedCharacterManager].characters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"characterCell" forIndexPath:indexPath];
    SHCharacter *character = [[CharacterManager sharedCharacterManager].characters objectAtIndex:indexPath.row];
    cell.textLabel.text = character.name;
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"preparing...");
    
    if ([segue.destinationViewController isKindOfClass:[SHDetailViewController class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SHCharacter *character = [[CharacterManager sharedCharacterManager].characters objectAtIndex:indexPath.row];
        
        
        
        SHDetailViewController *dvc = segue.destinationViewController;
        dvc.detailNameLabel.text = character.name;
    }

    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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
