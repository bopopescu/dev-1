//
//  BNREmployee.m
//  BMITime
//
//  Created by Samuel Svenningsen on 5/30/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#import "BNREmployee.h"

@implementation BNREmployee

- (double) yearsOfEmployment {
    // Do I have a non-nil hireDate?
    if (self.hireDate) {
        // NSTimeInterval is the same as double
        NSTimeInterval secs = [self.hireDate timeIntervalSinceNow];
        return secs / 31557600.0; // Seconds per year
    } else{
        return 0;
    }
}

// OVERIDE
- (float) bodyMassIndex {
    float normalBMI = [super bodyMassIndex];
    return normalBMI * .9;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<Employee %d>", self.employeeID];
}

@end
