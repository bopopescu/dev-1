//
//  main.m
//  TimeAfterTime
//
//  Created by Samuel Svenningsen on 5/25/15.
//  Copyright (c) 2015 Sam Svenningsen. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [[NSDate alloc] init];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [cal calendarIdentifier]);
        
        unsigned long day = [cal ordinalityOfUnit:NSCalendarUnitDay
                                           inUnit:NSCalendarUnitMonth
                                          forDate:now];
        NSLog(@"This is day %lu of the month", day);
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1994];
        [comps setMonth:7];
        [comps setDay:16];
        [comps setHour:7];
        [comps setMinute:31];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        
        double secondsSinceBirth = [now timeIntervalSinceDate:dateOfBirth];
        NSLog(@"Seconds since my birth: %f", secondsSinceBirth);
        
        // My computer's name
        NSHost *host = [NSHost currentHost];
        NSString *name = [host localizedName];
        NSLog(@"%@", name);
    }
    return 0;
}
