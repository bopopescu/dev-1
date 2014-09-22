//
//  LTViewController.m
//  LeTable
//
//  Created by Tim Novikoff on 9/13/14.
//  Copyright (c) 2014 Tim Novikoff. All rights reserved.
//

#import "LTViewController.h"
#import "LTMainTableViewController.h"

@interface LTViewController ()

@property (nonatomic, strong) LTMainTableViewController *myTableViewController;

@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;

@property (strong, nonatomic) IBOutlet UITextField *mainText;
@property (strong, nonatomic) IBOutlet UITextField *detailText;


@property (strong, nonatomic) NSMutableArray *tobuys;
@property (strong, nonatomic) NSMutableArray *todos;
@property (nonatomic, assign) int *selectedIndex;

@end

@implementation LTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.selectedIndex = 0;
    self.tobuys = [[NSMutableArray alloc] init];
    self.todos = [[NSMutableArray alloc] init];
    self.myTableViewController = [[LTMainTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    self.myTableViewController.view.frame = self.view.bounds;
    
    NSString *theValue = [[NSUserDefaults standardUserDefaults] valueForKey:@"the key"];
    NSLog(@"the value is: %@", theValue);
    
}

- (IBAction)myButtonPressed:(id)sender {
    
    
//    [self.view addSubview:self.myTableViewController.view];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.myTableViewController];
    self.myTableViewController.todos = self.todos;
    self.myTableViewController.tobuys = self.tobuys;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(dismissModalViewControllerAnimated:)];
    [self.myTableViewController.navigationItem setRightBarButtonItem:doneButton];
    
    
    [self presentViewController:navController animated:YES completion:nil];
}

- (IBAction)addButtonPressed:(id)sender {
     NSMutableArray *wordArray = [[NSMutableArray alloc] init];
    [wordArray addObject:self.mainText.text];
    [wordArray addObject:self.detailText.text];
    if (self.selectedIndex == 0){
        [self.tobuys addObject:wordArray];
    }
    else {
        [self.todos addObject:wordArray];
    }
    self.mainText.text = @"";
    self.detailText.text = @"";
}

- (IBAction)mySegmentedControllerValueChanged:(id)sender {
    
//    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
//    int selectedIndex = segmentedControl.selectedSegmentIndex;
//    NSLog(@"User selected index %d", selectedIndex);

    self.selectedIndex = self.mySegmentedControl.selectedSegmentIndex;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
