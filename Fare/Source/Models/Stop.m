//
//  Stop.m
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Stop.h"

@implementation Stop

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.timeOfArrival doubleValue], [self.timeOfArrival2 doubleValue]);
}

#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"uniqueName" : @"unique_name",
             @"humanName" : @"human_name",
             @"additionalName" : @"additional_name"};
}

@end
