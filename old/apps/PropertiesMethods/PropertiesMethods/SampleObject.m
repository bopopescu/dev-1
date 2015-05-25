//
//  SampleObject.m
//  PropertiesMethods
//
//  Created by Samuel Svenningsen on 9/13/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "SampleObject.h"

@interface SampleObject ()

@property (nonatomic, strong) NSString *privateStringProperty;

@end

@implementation SampleObject

- (void) doStuff{
    
    self.publicStringProperty = @"nyan cat";
    self.publicStringProperty = @"Bear Grylls";
}

- (void) doPrivateStuff{
    NSLog(@"doing private stuff");
}

-(void) doStuffParameter1: (NSString *) parameter1 andParamter2: (NSArray *) parameter2{
    NSLog(@"parameter1: %@", parameter1);
    NSLog(@"parameter2: %@", parameter2);
}

@end
