//
//  TraceRoute.m
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "TraceRoute.h"

@implementation TraceRoute

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

#pragma mark - NSObject

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"Sequence number: %@\nLatitude: %@\nLongitude: %@", self.sequenceNumber, self.latitude, self.longitude];
}

@end
