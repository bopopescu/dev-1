//
//  ViewController.m
//  LaTable
//
//  Created by Samuel Svenningsen on 9/13/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@interface ViewController ()

@property (nonatomic,strong) TableViewController *myTableViewController;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myTableViewController = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    self. myTableViewController.view.frame = self.view.bounds;
    
    NSString *theValue = [[NSUserDefaults standardUserDefaults] valueForKey:@"the key"];
    NSLog(@"the value is: %@", theValue);

    
    
}
- (IBAction)myButtonPressed:(id)sender {
//    [self.view addSubview:self.myTableViewController.view];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.myTableViewController];
    [self presentViewController:navController animated:YES completion:nil]; //INCLUDE THIS
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style: UIBarButtonItemStyleDone target:self action:@selector (dismissModalViewControllerAnimated:)];
    [self.myTableViewController.navigationItem setRightBarButtonItem:doneButton];
}

- (IBAction)mySegmentedControlerValueChanged:(id)sender {
    
    int selectedIndex = self.mySegmentedControl.selectedSegmentIndex;
    NSLog(@"User selected index %d", selectedIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
