//
//  AddGiftsViewController.m
//  All_Hallows_Read
//
//  Created by Samuel Svenningsen on 10/17/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "AddGiftsViewController.h"

@interface AddGiftsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *PersonText;
@property (weak, nonatomic) IBOutlet UITextField *GiftText;

@property (nonatomic, strong) GiftListTableViewController *myTableViewController;

@property (strong, nonatomic) NSMutableArray *giftArray;
@end

@implementation AddGiftsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view, typically from a nib.
    self.giftArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"giftArray"];
    if (self.giftArray == nil){
        self.giftArray = [[NSMutableArray alloc] init];
    }
    
    self.myTableViewController = [[GiftListTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    self.myTableViewController.view.frame = self.view.bounds;
    
    
}
- (IBAction)giftListPressed:(id)sender {
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
- (IBAction)AddListPressed:(id)sender {
    NSMutableArray *giftArray = [[NSMutableArray alloc] init];
    [giftArray addObject:self.PersonText.text];
    [giftArray addObject:self.GiftText.text];
    [self.giftArray addObject:giftArray];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.giftArray forKey:@"giftArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.PersonText.text = @"";
    self.GiftText.text = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
