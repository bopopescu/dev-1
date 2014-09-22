//
//  TBTableViewController.m
//  ToolBox
//
//  Created by Tim Novikoff on 9/20/14.
//  Copyright (c) 2014 Tim Novikoff. All rights reserved.
//

#import "TBTableViewController.h"
#import "TBRemoteViewController.h"
#import "TBLocalViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface TBTableViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@end

@implementation TBTableViewController

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

    self.title = @"Lessons";
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    
    [self.navigationItem setRightBarButtonItem:barButtonItem];
}

- (void) dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return @"Needs a View";
            break;
        }
        case 1:{
            return @"Doesn't need a view";
            break;
        }
        default:
            break;
    }
    
    return @"something went wrong";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int numberOfRows;
    switch (section) {
        case 0:{
            numberOfRows = [[self.items objectForKey:@"newView"] count];
            break;
        }
        case 1:{
            numberOfRows = [[self.items objectForKey:@"noNewView"] count];
            break;
        }
        default:
            break;
    }
    
    
    // Return the number of rows in the section.
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSDictionary *dict;
    
    switch (indexPath.section) {
        case 0:{
            NSArray *array = [self.items objectForKey:@"newView"];
            dict = [array objectAtIndex:indexPath.row];
            break;
        }
        case 1:{
            NSArray *array = [self.items objectForKey:@"noNewView"];
            dict = [array objectAtIndex:indexPath.row];
            break;
        }
        default:
            break;
    }
    
    cell.textLabel.text = [dict objectForKey:@"main"];
    cell.detailTextLabel.text = [dict objectForKey:@"detail"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0){
        if (indexPath.row == 0){
            TBRemoteViewController *remoteVC = [[TBRemoteViewController alloc] init];
            [self.navigationController pushViewController:remoteVC animated:YES];
        }
        if (indexPath.row == 1){
            TBLocalViewController *remoteVC = [[TBLocalViewController alloc] init];
            [self.navigationController pushViewController:remoteVC animated:YES];
        }
        if (indexPath.row == 2){
            TBTableViewController *deeperTBTVC = [[TBTableViewController alloc] initWithStyle:UITableViewStylePlain];
            deeperTBTVC.items = self.items;
            [self.navigationController pushViewController:deeperTBTVC animated:YES];
        }
    }
    if (indexPath.section == 1){
        if (indexPath.row == 0){
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector (timerFired:) userInfo:nil repeats:YES];
        }
        if (indexPath.row == 2){
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fox2" ofType:@"mov"]];
            self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
            
            
            [self.view addSubview:self.moviePlayer.view];
            [self.moviePlayer setFullscreen:YES animated:NO];
            self.moviePlayer.shouldAutoplay = YES;
        }
    }
    
    
}

- (void) timerFired: (NSTimer *) timer{
    
    NSLog(@"I've been fired!");
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
