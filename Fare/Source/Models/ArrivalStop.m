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
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

- (NSDate *)dateForTimeOfArrival:(NSTimeInterval)timeInterval {
    return [NSDate dateWithTimeIntervalSinceNow:timeInterval];
}

- (NSTimer *)timerCountingDownToTimeOfArrival:(NSTimeInterval)timeInterval {
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval invocation:nil repeats:NO];
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"timeOfArrival" : @"toa1",
             @"timeOfArrival2" : @"toa2"};
}


#pragma mark - NSObjet

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"ID 1: %@\nID 2: %@\nName: %@\nName 2: %@\nName 3: %@\nLatitude: %@\nLongitude: %@\nHeading: %@\nTime of arrival 1: %@\nTime of arrival 2: %@",
            self.id1,
            self.id2,
            self.name,
            self.name2,
            self.name3,
            self.latitude,
            self.longitude,
            self.heading,
            self.timeOfArrival,
            self.timeOfArrival2];
}

@end
