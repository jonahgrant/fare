//
//  UMNetworkingSession.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

typedef void (^UMArrayBlock)(NSArray *array);
typedef void (^UMErrorBlock)(NSError *error);

@interface UMNetworkingSession : NSObject

@property (nonatomic) NSUInteger retryCount;

/**
 Requests an array of operating bus routes with their arrival times.
 @param successBlock A block of code handling a successful request containing array of Arrival objects.
 @param errorBlock A block of code handling either a network error, or a JSON error return by the server.
 */
- (void)fetchArrivalsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock;
/**
 Requests an array of buses with their current coordinates.
 @param successBlock A block of code handling a successful request containing array of Bus objects.
 @param errorBlock A block of code handling either a network error, or a JSON error return by the server.
 */
- (void)fetchBusesWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock;
/**
 Requests an array of all bus stops.
 @param successBlock A block of code handling a successful request containing array of Stop objects.
 @param errorBlock A block of code handling either a network error, or a JSON error return by the server.
 */
- (void)fetchStopsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock;
/**
 Requests an array of operating Routes.
 @param successBlock A block of code handling a successful request containing array of Route objects.
 @param errorBlock A block of code handling either a network error, or a JSON error return by the server.
 */
- (void)fetchRoutesWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock;
/**
 Requests an array of current announcements.
 @param successBlock A block of code handling a successful request containing array of Announcement objects.
 @param errorBlock A block of code handling either a network error, or a JSON error return by the server.
 */
- (void)fetchAnnouncementsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock;
/**
 Requests an array of coordinates that represent the street route that a given route ID operates on.
 @param routeID A valid ID of a route
 @param successBlock A block of code handling a successful request containing array of TraceRoute objects.
 @param errorBlock A block of code handling either a network error, or a JSON error return by the server.
 */
- (void)fetchTraceRouteForRouteID:(NSString *)routeID withSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock;

@end
