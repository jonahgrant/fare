//
//  UMNetworkingSession.m
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "UMNetworkingSession.h"
#import "AFHTTPRequestOperationManager.h"
#import "UMResponseSerializer.h"
#import "Constants.h"
#import "Objects.h"

#define HandlerBlock(b) ((b) ? (^(AFHTTPRequestOperation *_, id x){ (b)(x); }) : NULL)

@interface UMNetworkingSession ()

@property (nonatomic, readonly) AFHTTPRequestOperationManager *manager;

- (NSString *)rootURLWithPath:(NSString *)path;

@end

@implementation UMNetworkingSession

- (instancetype)init {
    if (self = [super init]) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

- (NSString *)rootURLWithPath:(NSString *)path {
    return [kUMRootURL stringByAppendingString:path];
}

- (void)fetchArrivalsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [[self.manager GET:[self rootURLWithPath:kUMAPIFetchArrivals]
           parameters:nil
              success:HandlerBlock(successBlock)
               failure:HandlerBlock(errorBlock)]
     setResponseSerializer:[Arrival um_xmlArrayResponseSerializer]];
}

- (void)fetchBusesWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [[self.manager GET:[self rootURLWithPath:kUMAPIFetchBuses]
            parameters:nil
               success:HandlerBlock(successBlock)
               failure:HandlerBlock(errorBlock)]
     setResponseSerializer:[Bus um_jsonArrayResponseSerializer]];
}

- (void)fetchAnnouncementsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [[self.manager GET:[self rootURLWithPath:kUMAPIFetchAnnouncements]
            parameters:nil
               success:HandlerBlock(successBlock)
               failure:HandlerBlock(errorBlock)]
     setResponseSerializer:[Announcement um_jsonArrayResponseSerializer]];
}

- (void)fetchRoutesWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [[self.manager GET:[self rootURLWithPath:kUMAPIFetchRoutes]
            parameters:nil
               success:HandlerBlock(successBlock)
               failure:HandlerBlock(errorBlock)]
     setResponseSerializer:[Route um_jsonArrayResponseSerializer]];
}

- (void)fetchStopsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [[self.manager GET:[self rootURLWithPath:kUMAPIFetchStops]
            parameters:nil
               success:HandlerBlock(successBlock)
               failure:HandlerBlock(errorBlock)]
     setResponseSerializer:[Stop um_jsonArrayResponseSerializer]];
}

- (void)fetchTraceRouteForRouteID:(NSString *)routeID withSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [[self.manager GET:[self rootURLWithPath:[NSString stringWithFormat:kUMAPIFetchTraceRoute, routeID]]
            parameters:nil
               success:HandlerBlock(successBlock)
               failure:HandlerBlock(errorBlock)]
     setResponseSerializer:[TraceRoute um_xmlArrayResponseSerializer]];
}

@end
