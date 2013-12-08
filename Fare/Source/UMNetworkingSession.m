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

- (void)GET:(NSString *)getEndpoint
 parameters:(NSDictionary *)parameters
    success:(void (^)(AFHTTPRequestOperation *, id))success
    failure:(void (^)(AFHTTPRequestOperation *, id))failure
 retryCount:(NSUInteger)retry
serializer:(AFHTTPResponseSerializer *)serializer {
    
    __block AFHTTPRequestOperation *_operation;
    __block NSError *_error;
    
    if (retry <= 0) {
        if (failure) {
            failure(_operation, _error);
        }
    } else {
        [[self.manager GET:getEndpoint
                parameters:parameters
                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       success(operation, responseObject);
                   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       _operation = operation;
                       _error = error;
                       [self GET:getEndpoint
                      parameters:parameters
                         success:success
                         failure:failure
                      retryCount:retry - 1
                      serializer:serializer];
                   }] setResponseSerializer:serializer];
    }
    
}

- (void)fetchArrivalsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [self GET:[self rootURLWithPath:kUMAPIFetchArrivals]
   parameters:nil
      success:HandlerBlock(successBlock)
      failure:HandlerBlock(errorBlock)
   retryCount:self.retryCount
   serializer:[Arrival um_xmlArrayResponseSerializer]];
}

- (void)fetchBusesWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [self GET:[self rootURLWithPath:kUMAPIFetchBuses] parameters:nil
      success:HandlerBlock(successBlock)
      failure:HandlerBlock(errorBlock)
   retryCount:self.retryCount
   serializer:[Bus um_jsonArrayResponseSerializer]];
}

- (void)fetchAnnouncementsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [self GET:[self rootURLWithPath:kUMAPIFetchAnnouncements]
   parameters:nil
      success:HandlerBlock(successBlock)
      failure:HandlerBlock(errorBlock)
   retryCount:self.retryCount
   serializer:[Announcement um_jsonArrayResponseSerializer]];
}

- (void)fetchRoutesWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [self GET:[self rootURLWithPath:kUMAPIFetchRoutes]
   parameters:nil
      success:HandlerBlock(successBlock)
      failure:HandlerBlock(errorBlock)
   retryCount:self.retryCount
   serializer:[Route um_jsonArrayResponseSerializer]];
}

- (void)fetchStopsWithSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [self GET:[self rootURLWithPath:kUMAPIFetchStops]
   parameters:nil
      success:HandlerBlock(successBlock)
      failure:HandlerBlock(errorBlock)
   retryCount:self.retryCount
   serializer:[Stop um_jsonArrayResponseSerializer]];
}

- (void)fetchTraceRouteForRouteID:(NSString *)routeID withSuccessBlock:(UMArrayBlock)successBlock errorBlock:(UMErrorBlock)errorBlock {
    [self GET:[self rootURLWithPath:[NSString stringWithFormat:kUMAPIFetchTraceRoute, routeID]]
   parameters:nil
      success:HandlerBlock(successBlock)
      failure:HandlerBlock(errorBlock)
   retryCount:self.retryCount
   serializer:[TraceRoute um_xmlArrayResponseSerializer]];
}

@end
