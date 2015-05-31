//
//  BNREmployee.h
//  BMITime
//
//  Created by Samuel Svenningsen on 5/30/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

- (double)yearsOfEmployment;

@end
