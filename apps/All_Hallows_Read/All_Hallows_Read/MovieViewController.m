//
//  MovieViewController.m
//  All_Hallows_Read
//
//  Created by Samuel Svenningsen on 10/17/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "MovieViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MovieViewController ()


@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)watchVideo:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Neil" ofType:@"mp4"]];
    
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: url];
    
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer setFullscreen:YES animated:YES];
    self.moviePlayer.shouldAutoplay = YES;
    
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
