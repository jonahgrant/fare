//
//  Arrival.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

@import CoreLocation;
@import UIKit;

#import "Mantle.h"

@class ArrivalStop;

@interface Arrival : MTLModel <MTLJSONSerializing>
 
/**
 Returns the route name
 */
@property (nonatomic, copy, readonly) NSString *name;

/**
 Returns the id of the route
 */
@property (nonatomic, copy, readonly) NSString *id;

/**
 Returns the id of the stop that the route "repeats" on
 */
@property (nonatomic, copy, readonly) NSString *topOfLoop;

/**
 Returns the hex representation route's designated color
 */
@property (nonatomic, copy, readonly) UIColor *routeColor;

/**
 Returns an NSArray of ArrivalStop objects that the route is servicing
 */
@property (strong, nonatomic, readonly) NSArray *stops;

@end
