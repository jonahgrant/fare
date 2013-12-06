//
//  ArrivalStop.m
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "ArrivalStop.h"

@implementation ArrivalStop

#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"timeOfArrival" : @"toa1",
             @"timeOfArrival2" : @"toa2"};
}

@end
