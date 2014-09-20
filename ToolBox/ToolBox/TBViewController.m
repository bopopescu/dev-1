//
//  TBViewController.m
//  ToolBox
//
//  Created by Tim Novikoff on 9/20/14.
//  Copyright (c) 2014 Tim Novikoff. All rights reserved.
//

#import "TBViewController.h"
#import "TBTableViewController.h"

@interface TBViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *mainTextField;
@property (strong, nonatomic) IBOutlet UITextField *detailTextField;
@property (strong, nonatomic) NSMutableDictionary *items;


@end

@implementation TBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.items = [[[NSUserDefaults standardUserDefaults] objectForKey:@"items"] mutableCopy];
    
    if (self.items == nil) {
        self.items = [[NSMutableDictionary alloc] init];
    }
    
}
- (IBAction)addButtonPressed:(id)sender {
    
    NSString *mainString = self.mainTextField.text;
    NSString *detailString = self.detailTextField.text;
    
    NSDictionary *itemDictionary = @{@"main": mainString, @"detail": detailString};
    
    if (self.mySegmentedControl.selectedSegmentIndex == 0) {
        NSMutableArray *array = [[self.items objectForKey:@"newView"] mutableCopy];
        if (array == nil) {
            array = [[NSMutableArray alloc] init];
        }
        
        [array addObject:itemDictionary];
        [self.items setObject:array forKey:@"newView"];
    }
    else{
        NSMutableArray *array = [[self.items objectForKey:@"noNewView"] mutableCopy];
        if (array == nil) {
            array = [[NSMutableArray alloc] init];
        }
        
        [array addObject:itemDictionary];
        [self.items setObject:array forKey:@"noNewView"];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:self.items forKey:@"items"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.mainTextField.text = @"";
    self.detailTextField.text = @"";
}
- (IBAction)showButtonPressed:(id)sender {
    NSLog(@"items: %@", self.items);
    
    TBTableViewController *tbTVC = [[TBTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    tbTVC.items = self.items;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tbTVC];
    [self presentViewController:navController animated:YES completion:^{
        NSLog(@"The navigation controller has been presented");
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
