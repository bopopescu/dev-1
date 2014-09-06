//
//  HWViewController.m
//  HelloWorld
//
//  Created by Samuel Svenningsen on 9/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "HWViewController.h"

@interface HWViewController ()
@property (strong, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myLabel.text = @"Goat";
    NSLog(@"Hello Console!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
