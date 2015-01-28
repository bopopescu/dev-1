//
//  ViewController.m
//  All_Hallows_Read
//
//  Created by Samuel Svenningsen on 10/17/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "ViewController.h"

#import <MediaPlayer/MediaPlayer.h>
@interface ViewController ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) GiftListTableViewController *myTableViewController;

@property (strong, nonatomic) NSMutableArray *giftArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.giftArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"giftArray"];
    if (self.giftArray == nil){
        self.giftArray = [[NSMutableArray alloc] init];
    }
    self.myTableViewController = [[GiftListTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    self.myTableViewController.view.frame = self.view.bounds;
    
    
}
- (IBAction)neilVid:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Neil" ofType:@"mp4"]];
    
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: url];
    
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer setFullscreen:YES animated:YES];
    self.moviePlayer.shouldAutoplay = YES;
    
}
- (IBAction)addGiftsPressed:(id)sender {
    [self.myTableViewController.tableView reloadData];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.myTableViewController];
    self.myTableViewController.giftArray = self.giftArray;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(dismissModalViewControllerAnimated:)];
    [self.myTableViewController.navigationItem setRightBarButtonItem:doneButton];
    
    
    [self presentViewController:navController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
