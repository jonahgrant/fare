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
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"uniqueName" : @"unique_name",
             @"humanName" : @"human_name",
             @"additionalName" : @"additional_name"};
}

#pragma mark - NSObjet

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"ID: %@\nUnique name: %@\nHuman name: %@\nAdditional name: %@\nLatitude: %@\nLongitude: %@\nHeading: %@",
            self.id,
            self.uniqueName,
            self.humanName,
            self.additionalName,
            self.latitude,
            self.longitude,
            self.heading];
}

@end
