//
//  TBRemoteViewController.m
//  ToolBox
//
//  Created by Samuel Svenningsen on 9/20/14.
//  Copyright (c) 2014 Tim Novikoff. All rights reserved.
//

#import "TBRemoteViewController.h"

@interface TBRemoteViewController ()

@end

@implementation TBRemoteViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Web View (Remote)";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 60, 200, 50);
    [button setTitle:@"show web view" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(showWebView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void) showWebView{
    UIWebView *webView = [[UIWebView alloc] init];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.google.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    webView.frame = CGRectMake(0, 150, 320, 300);
    [self.view addSubview:webView];
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
