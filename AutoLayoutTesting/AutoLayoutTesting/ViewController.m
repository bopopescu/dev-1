//
//  ViewController.m
//  AutoLayoutTesting
//
//  Created by Samuel Svenningsen on 9/27/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

-(void)loadView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = @"I <3 Cornell University";
    titleLabel.font = [UIFont boldSystemFontOfSize:22];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    [self.view addSubview:titleLabel];
    
    UIImage *image = [UIImage imageNamed:@"cornell"];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];

    
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView = imageView;
    [self.view addSubview:imageView];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    textLabel.text = @"Cornell University was founded on April 27, 1865, as the result of a New York State (NYS) Senate bill that named the university as the state's land grant institution. Senator Ezra Cornell offered his farm in Ithaca, New York as a site and $500,000 of his personal fortune as an initial endowment. Fellow senator and experienced educator Andrew Dickson White agreed to be the first president. During the next three years, White oversaw the construction of the initial two buildings and traveled around the globe to attract students and faculty.[12] The university was inaugurated on October 7, 1868, and 412 men were enrolled the next day.";
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:11];
    
    
    self.textLabel = textLabel;
    [self.view addSubview:textLabel];
    NSDictionary *views = NSDictionaryOfVariableBindings(titleLabel,textLabel,imageView);
    NSDictionary *metrics = @{@"titleSpace":@40, @"imageSpace":@30, @"imageHeight":@80, @"textSpace":@30};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-titleSpace-[titleLabel]-imageSpace-[imageView(imageHeight)]-textSpace-[textLabel]" options:0 metrics:metrics views:views]];
    
    NSLayoutConstraint *singleConstraint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.view addConstraint:singleConstraint];
    
    NSLayoutConstraint *singleImageView = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.view addConstraint:singleImageView];
    
    NSLayoutConstraint *singleImageViewConstraint = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    [self.view addConstraint:singleImageViewConstraint];
    
    NSLayoutConstraint *singleText = [NSLayoutConstraint constraintWithItem:textLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.view addConstraint:singleText];
    
    NSLayoutConstraint *singleTextWidth = [NSLayoutConstraint constraintWithItem:textLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.8 constant:0];
    
    [self.view addConstraint:singleTextWidth];
    //horizontal
//    @"|-[titleLabel]-|"
//    @"V:|-[titleLabel]"
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
