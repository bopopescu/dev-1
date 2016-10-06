//
//  BNRPerson.h
//  BMITime
//
//  Created by Samuel Svenningsen on 5/30/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject {
    float _heightInMeters;
    int _weightInKilos;
}

// BNRPerson has two properties
@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;

// BNRPerson has a method that calculates the Body Mass Index
- (float) bodyMassIndex;

@end
