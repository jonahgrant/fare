//
//  ArrivalStop.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

@import CoreLocation;

#import "Mantle.h"

@interface ArrivalStop : MTLModel <MTLJSONSerializing>

/**
 The stop has two different IDs, this returns the first one
 */
@property (nonatomic, copy, readonly) NSString *id1;

/**
 The stop has two different IDs, this returns the second one
 */
@property (nonatomic, copy, readonly) NSString *id2;

/**
 The stop has three different names, this returns the first one
 Compared to the Stop object, this would correlate with uniqueName
 */
@property (nonatomic, copy, readonly) NSString *name;

/**
 The stop has three different names, this returns the second one
 Compared to the Stop object, this would correlate with humanName
 */
@property (nonatomic, copy, readonly) NSString *name2;

/**
 The stop has three different names, this returns the third one
 Compared to the Stop object, this would correlate with additionalName
 */
@property (nonatomic, copy, readonly) NSString *name3;

/**
 Returns the latitude that the stop resides on
 */
@property (nonatomic, readonly) CLLocationDegrees latitude;

/**
 Returns the longitude that the stop resides on
 */
@property (nonatomic, readonly) CLLocationDegrees longitude;

/**
 Returns the heading that the stop is directing towards
 */
@property (nonatomic, copy, readonly) NSString *heading;

/**
 Returns the number of seconds until the first bus arrives
 */
@property (nonatomic, readonly) NSTimeInterval timeOfArrival;

/**
 Returns the number of seconds until the second bus arrives
 */
@property (nonatomic, readonly) NSTimeInterval timeOfArrival2;

- (CLLocationCoordinate2D)coordinate;

@end
