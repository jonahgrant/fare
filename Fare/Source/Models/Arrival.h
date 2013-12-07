//
//  Arrival.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface Arrival : MTLModel <MTLJSONSerializing>

/**********************

        Arrival
 This class basically
 contains two different
 types of objects: a
 Route and an array of
 ArrivalStops, which are
 a modified version of
 Stop, except with ti-
 me of arrivals.
 
 *********************/
 
/**
 Returns the route name
 */
@property (nonatomic, copy) NSString *name;

/**
 Returns the id of the route
 */
@property (nonatomic, copy) NSString *id;

/**
 Returns the id of the stop that the route "repeats" on
 */
@property (nonatomic, copy) NSString *topOfLoop;

/**
 Returns the route's designated color
 */
@property (nonatomic, copy) NSString *busRouteColor;

/**
 Returns an NSArray of ArrivalStop objects
 */
@property (strong, nonatomic) NSArray *stops;

@end
