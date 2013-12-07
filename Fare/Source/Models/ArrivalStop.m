//
//  ArrivalStop.m
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "ArrivalStop.h"

@implementation ArrivalStop

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.timeOfArrival doubleValue], [self.timeOfArrival2 doubleValue]);
}

- (NSDate *)dateForTimeOfArrival:(NSTimeInterval)timeInterval {
    return [NSDate dateWithTimeIntervalSinceNow:timeInterval];
}

- (NSTimer *)timerCountingDownToTimeOfArrival:(NSTimeInterval)timeInterval {
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval invocation:nil repeats:NO];
}

#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"timeOfArrival" : @"toa1",
             @"timeOfArrival2" : @"toa2"};
}

@end
