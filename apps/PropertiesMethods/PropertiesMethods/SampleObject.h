//
//  SampleObject.h
//  PropertiesMethods
//
//  Created by Samuel Svenningsen on 9/13/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SampleObject : NSObject

@property (nonatomic, strong) NSString *publicStringProperty;

-(void) doStuff;

-(void) doStuffParameter1: (NSString *) parameter1 andParamter2: (NSArray *) parameter2;

@end
