//
//  BNRPerson.m
//  BMITime
//
//  Created by Samuel Svenningsen on 5/30/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

- (float) bodyMassIndex {
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

- (void) addYourselfToArray:(NSMutableArray *)theArray {
    [theArray addObject:self];
}

@end
