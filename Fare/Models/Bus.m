//
//  Bus.m
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Bus.h"

@implementation Bus

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"routeName" : @"route",
             @"routeID" : @"route"};
}

#pragma mark - NSObjet

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"Heading: %@\nID: %@\nLatitude: %@\nLongitude: %@\nRoute ID: %@",
            self.heading,
            self.id,
            self.latitude,
            self.longitude,
            self.routeID];
}

@end
