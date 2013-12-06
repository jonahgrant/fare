//
//  UMResponseSerializer.m
//  UMBus
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "UMResponseSerializer.h"
#import "Mantle.h"
#import "XMLDictionary.h"

NSString * const UMResponseSerializerErrorDomain = @"UMResponseSerializerErrorDomain";

@interface UMJSONResponseSerializer ()

@property (readonly) Class responseObjectClass;
@property (readonly) BOOL inArray;

@end

@interface UMXMLResponseSerializer ()

@property (readonly) Class responseObjectClass;
@property (readonly) BOOL inArray;

@end

@implementation UMJSONResponseSerializer

- (instancetype)initWithResponseObjectClass:(Class)responseObjectClass inArray:(BOOL)inArray {
    if (self = [super init]) {
        _responseObjectClass = responseObjectClass;
        _inArray = inArray;
    }
    return self;
}

- (id)arrayResponseObjectForJSONObject:(id)object error:(NSError *__autoreleasing *)error {
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *responseObjects = [NSMutableArray array];
        for (id element in object) {
            id responseObject = [self nonArrayResponseObjectForJSONObject:element
                                                                    error:error];
            if (responseObject) {
                [responseObjects addObject:responseObject];
            } else {
                return nil;
            }
        }
        return responseObjects;
    } else {
        if (error) {
            *error = [NSError errorWithDomain:UMResponseSerializerErrorDomain
                                         code:NSURLErrorBadServerResponse
                                     userInfo:nil];
        }
        return nil;
    }
}

- (id)nonArrayResponseObjectForJSONObject:(id)object error:(NSError *__autoreleasing *)error {
    if ([object isKindOfClass:[NSDictionary class]]) {
        return [MTLJSONAdapter modelOfClass:self.responseObjectClass
                         fromJSONDictionary:object
                                      error:error];
    } else {
        if (error) {
            *error = [NSError errorWithDomain:UMResponseSerializerErrorDomain
                                         code:NSURLErrorBadServerResponse
                                     userInfo:nil];
        }
        return nil;
    }
}

- (NSError *)errorForJSONObject:(id)object error:(NSError *__autoreleasing *)error {
    if ([object isKindOfClass:[NSDictionary class]]) {
        return nil;
    } else {
        if (error) {
            *error = [NSError errorWithDomain:UMResponseSerializerErrorDomain
                                         code:NSURLErrorBadServerResponse
                                     userInfo:nil];
        }
        return nil;
    }
}

#pragma mark AFURLResponseSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    NSDictionary *jsonDict = [super responseObjectForResponse:response
                                                         data:data
                                                        error:error];
    id errorObject = jsonDict[@"error"];
    if (errorObject) {
        NSError *apiError = [self errorForJSONObject:errorObject
                                               error:error];
        if (error && apiError) {
            *error = apiError;
        }
        return nil;
    }
    
    id dataObject = jsonDict[@"response"];
    if (self.inArray) {
        return [self arrayResponseObjectForJSONObject:dataObject
                                                error:error];
    } else {
        return [self nonArrayResponseObjectForJSONObject:dataObject
                                                   error:error];
    }
}

@end

@implementation UMXMLResponseSerializer

- (instancetype)initWithResponseObjectClass:(Class)responseObjectClass inArray:(BOOL)inArray {
    if (self = [super init]) {
        _responseObjectClass = responseObjectClass;
        _inArray = inArray;
    }
    return self;
}

- (NSArray *)arrayResponseObjectForXMLObject:(id)object error:(NSError *__autoreleasing *)error {
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *responseObjects = [NSMutableArray array];
        for (id element in object) {
            id responseObject = [self nonArrayResponseObjectForXMLObject:element
                                                                   error:error];
            if (responseObject) {
                [responseObjects addObject:responseObject];
            } else {
                return nil;
            }
        }
        return responseObjects;
    } else {
        if (error) {
            *error = [NSError errorWithDomain:UMResponseSerializerErrorDomain
                                         code:NSURLErrorBadServerResponse
                                     userInfo:nil];
        }
        return nil;
    }
}

- (id)nonArrayResponseObjectForXMLObject:(id)object error:(NSError *__autoreleasing *)error {
    if ([object isKindOfClass:[NSDictionary class]]) {
        return [MTLJSONAdapter modelOfClass:self.responseObjectClass
                         fromJSONDictionary:object
                                      error:error];
    } else {
        if (error) {
            *error = [NSError errorWithDomain:UMResponseSerializerErrorDomain
                                         code:NSURLErrorBadServerResponse
                                     userInfo:nil];
        }
        return nil;
    }
    
    return nil;
}

#pragma mark AFURLResponseSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    
    NSDictionary *xmlDict = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
    
    if (xmlDict[@"error"]) {
        return nil;
    }
    
    if ([[xmlDict objectForKey:@"__name"] isEqual:@"livefeed"]) {
        if ([xmlDict objectForKey:@"route"]) {
            NSArray *objects = [xmlDict objectForKey:@"route"];
            if (self.inArray) {
                return [self arrayResponseObjectForXMLObject:objects
                                                       error:error];
            } else {
                return [self nonArrayResponseObjectForXMLObject:objects
                                                          error:error];
            }
        }
        
        if ([xmlDict objectForKey:@"item"]) {
            NSArray *objects = [xmlDict objectForKey:@"item"];
            if (self.inArray) {
                return [self arrayResponseObjectForXMLObject:objects
                                                       error:error];
            } else {
                return [self nonArrayResponseObjectForXMLObject:objects
                                                          error:error];
            }
        }
    }
    
    if ([[xmlDict objectForKey:@"__name"] isEqual:@"histdata"]) {
        if ([xmlDict objectForKey:@"item"]) {
            NSArray *objects = [xmlDict objectForKey:@"item"];
            if (self.inArray) {
                return [self arrayResponseObjectForXMLObject:objects
                                                       error:error];
            } else {
                return [self nonArrayResponseObjectForXMLObject:objects
                                                          error:error];
            }
        }
    }
    
    return nil;
}

@end

@implementation MTLModel (UMResponseSerializer)

+ (UMJSONResponseSerializer *)um_jsonResponseSerializer {
    return [[UMJSONResponseSerializer alloc] initWithResponseObjectClass:self inArray:NO];
}

+ (UMJSONResponseSerializer *)um_jsonArrayResponseSerializer {
    return [[UMJSONResponseSerializer alloc] initWithResponseObjectClass:self inArray:YES];
}

+ (UMXMLResponseSerializer *)um_xmlResponseSerializer {
    return [[UMXMLResponseSerializer alloc] initWithResponseObjectClass:self inArray:NO];
}

+ (UMXMLResponseSerializer *)um_xmlArrayResponseSerializer {
    return [[UMXMLResponseSerializer alloc] initWithResponseObjectClass:self inArray:YES];
}

@end
