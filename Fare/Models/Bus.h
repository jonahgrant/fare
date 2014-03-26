//
//  Bus.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

@import CoreLocation;

#import "Mantle.h"

@interface Bus : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *heading;
@property (nonatomic, copy, readonly) NSString *id;
@property (nonatomic, readonly) CLLocationDegrees latitude;
@property (nonatomic, readonly) CLLocationDegrees longitude;
@property (nonatomic, copy, readonly) NSString *routeID;

- (CLLocationCoordinate2D)coordinate;

@end
