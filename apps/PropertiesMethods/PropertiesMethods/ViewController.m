//
//  ViewController.m
//  PropertiesMethods
//
//  Created by Samuel Svenningsen on 9/13/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "ViewController.h"
#import "SampleObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SampleObject *sampleObject = [[SampleObject alloc] init];
    sampleObject.publicStringProperty = @"Keyboard Cat";
    
    NSLog(@"%@", sampleObject.publicStringProperty);
    
    [sampleObject doStuff];
    NSLog(@"%@", sampleObject.publicStringProperty);
    //NSLog(@"%@", sampleObject.privateStringProperty);//does not work bc it's private
    
//    [sampleObject doPrivateStuff];//does not work bc it is a private method
    [sampleObject doStuffParameter1:@"actual advice mallard" andParamter2:@[@"fould bechelor frog", @"good guy greg", @"most interesting man in the world"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
