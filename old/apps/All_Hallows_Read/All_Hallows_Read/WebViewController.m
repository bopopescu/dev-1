//
//  WebViewController.m
//  All_Hallows_Read
//
//  Created by Samuel Svenningsen on 10/17/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *faqWebView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.faqWebView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"http://www.allhallowsread.com/the-faq/"];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    [self.faqWebView loadRequest:requestURL];
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
