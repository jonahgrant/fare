//
//  Stop.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "Mantle.h"

@interface Stop : MTLModel <MTLJSONSerializing>

/**
 Returns the stop's ID
 */
@property (nonatomic, copy) NSString *id;

/**
 Returns the stop's unique name
 */
@property (nonatomic, copy) NSString *uniqueName;

/**
 Returns the stop's human name
 */
@property (nonatomic, copy) NSString *humanName;

/**
 Returns the stop's additional name, if it has one
 */
@property (nonatomic, copy) NSString *additionalName;

/**
 Returns the latitude that the stop resides on
 */
@property (nonatomic, copy) NSString *latitude;

/**
 Returns the longitude that the stop resides on
 */
@property (nonatomic, copy) NSString *longitude;

/**
 Returns the heading that the stop is directing
 */
@property (nonatomic, copy) NSString *heading;

/**
 Returns a CLLocationCoordinate2D containing the stop's latitude and longitude.
 */
- (CLLocationCoordinate2D)coordinate;

@end
