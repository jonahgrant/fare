//
//  ArrivalStop.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "Mantle.h"

@interface ArrivalStop : MTLModel <MTLJSONSerializing>

/**************************
 
       ArrivalStop
 This class is a modified
 version of the Stop object
 except with two timeOfArrival
 objects and a few methods
 to convert arrival times 
 into other usable objects.
 
 ************************/


/**
 The stop has two different IDs, this returns the first one
 */
@property (nonatomic, copy) NSString *id1;

/**
 The stop has two different IDs, this returns the second one
 */
@property (nonatomic, copy) NSString *id2;

/**
 The stop has three different names, this returns the first one
 Compared to the Stop object, this would correlate with uniqueName
 */
@property (nonatomic, copy) NSString *name;

/**
 The stop has three different names, this returns the second one
 Compared to the Stop object, this would correlate with humanName
 */
@property (nonatomic, copy) NSString *name2;

/**
 The stop has three different names, this returns the third one
 Compared to the Stop object, this would correlate with additionalName
 */
@property (nonatomic, copy) NSString *name3;

/**
 Returns the latitude that the stop resides on
 */
@property (nonatomic, copy) NSString *latitude;

/**
 Returns the longitude that the stop resides on
 */
@property (nonatomic, copy) NSString *longitude;

/**
 Returns the heading that the stop is directing towards
 */
@property (nonatomic, copy) NSString *heading;

/**
 Returns the number of seconds until the first bus arrives
 */
@property (nonatomic) NSTimeInterval timeOfArrival;

/**
 Returns the number of seconds until the second bus arrives
 */
@property (nonatomic) NSTimeInterval timeOfArrival2;


/**
 Returns a CLLocationCoordinate2D containing the stop's latitude and longitude.
 */
- (CLLocationCoordinate2D)coordinate;

/**
 Returns an NSDate object representing when a given time of arrival will occur.
 @param timeInterval An NSTimeInterval representing a time of arrival.
 */
- (NSDate *)dateForTimeOfArrival:(NSTimeInterval)timeInterval;

/**
 Returns an NSTimer object counting down to when given time of arrival will occur.
 @param timeInterval An NSTimeInterval representing a time of arrival.
 */
- (NSTimer *)timerCountingDownToTimeOfArrival:(NSTimeInterval)timeInterval;

@end
