//
//  TBLocalViewController.m
//  ToolBox
//
//  Created by Samuel Svenningsen on 9/20/14.
//  Copyright (c) 2014 Tim Novikoff. All rights reserved.
//

#import "TBLocalViewController.h"

@interface TBLocalViewController ()

@end

@implementation TBLocalViewController
- (IBAction)showViewButtonPressed:(id)sender {
    UIWebView *webView = [[UIWebView alloc] init];
    
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *string = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:nil];
    string = [string stringByReplacingOccurrencesOfString:@"People" withString:@"goats"];
    [webView loadHTMLString:string baseURL:nil];
    webView.frame = CGRectMake(0, 100, 320, 150);
    [self.view addSubview:webView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
