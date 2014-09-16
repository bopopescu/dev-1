//
//  TableViewController.m
//  LaTable
//
//  Created by Samuel Svenningsen on 9/13/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "HomeTableViewController.h"
#import "ViewController.h"

@interface HomeTableViewController()

@end

@implementation HomeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] init]];
    self.title = @"Settings";
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    
    NSInteger r = indexPath.row;
    
    cell.textLabel.text = [NSString stringWithFormat:@"Browchicbrocow"];
    cell.detailTextLabel.text = @"whasssssaaaaap";
    
    if (r%2 == 0){
        cell.backgroundColor = [UIColor redColor];
    }
    else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    
    return cell;
}

- (void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"warning" message:@"You have selected a row!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"That's not ok", nil];
    [alertView show];
    
    
    [[NSUserDefaults standardUserDefaults] setValue:@"the value" forKey:@"the key"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
