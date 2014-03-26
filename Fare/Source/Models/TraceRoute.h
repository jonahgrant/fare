//
//  TraceRoute.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

@import CoreLocation;

#import "Mantle.h"

@interface TraceRoute : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *sequenceNumber;
@property (nonatomic, readonly) CLLocationDegrees latitude;
@property (nonatomic, readonly) CLLocationDegrees longitude;

- (CLLocationCoordinate2D)coordinate;

@end
