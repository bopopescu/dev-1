//
//  main.m
//  BMITime
//
//  Created by Samuel Svenningsen on 5/30/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BNREmployee *mikey = [[BNREmployee alloc] init];
        
        [mikey setWeightInKilos:72];
        [mikey setHeightInMeters:1.8];
        mikey.employeeID = 22;
        mikey.hireDate = [NSDate date];
        
        
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"Mikey is %.2f meters tall and weights %d kilograms", height, weight);
        NSLog(@"Employee %@ hired on %@", mikey, mikey.hireDate);
        
        double years = [mikey yearsOfEmployment];
        NSLog(@"Mikey has a BMI of %.2f, and has been working with us for %.2f years",
              [mikey bodyMassIndex], years);
    }
    return 0;
}
