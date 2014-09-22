//
//  LTMainTableViewController.m
//  LeTable
//
//  Created by Tim Novikoff on 9/13/14.
//  Copyright (c) 2014 Tim Novikoff. All rights reserved.
//

#import "LTMainTableViewController.h"

@interface LTMainTableViewController ()

@end

@implementation LTMainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tobuys = [[NSMutableArray alloc] init];
    self.todos = [[NSMutableArray alloc] init];
    
    
    self.title = @"Settings";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0){
        return [self.tobuys count];
    }
    else{
       return [self.todos count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    int r = indexPath.row;
    int s = indexPath.section;
    
    if (s == 1){
        
        cell.textLabel.text = self.todos[r][0];
        cell.detailTextLabel.text = self.todos[r][1];
    }
    else{
        cell.textLabel.text = self.tobuys[r][0];
        cell.detailTextLabel.text = self.tobuys[r][1];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int r = indexPath.row;
    int s = indexPath.section;
    NSString *main = @"";
    NSString *detail = @"";
    if (s == 1){
        
        main = self.todos[r][0];
        detail = self.todos[r][1];
    }
    else{
        main = self.tobuys[r][0];
        detail = self.tobuys[r][1];
    }
     NSString *string = [NSString stringWithFormat:@"Section %s \n %s", main, detail];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Selection" message:@"You have selected a row!" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Thatz not okay", nil];
    
    [alertView show];
    
    [[NSUserDefaults standardUserDefaults] setValue:@{@"name": @"Tim Novikoff", @"passion": @"fruit"} forKey:@"the key"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
