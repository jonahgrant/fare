//
//  Arrival.m
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 jonahgrant. All rights reserved.
//

#import "Arrival.h"
#import "Stop.h"

@implementation Arrival

+ (NSValueTransformer *)stopsJSONTransformer {
    NSValueTransformer *dictionaryTransformer = [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[Stop class]];

    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSArray *dictionaries) {
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictionaries.count];
        for (id JSONDictionary in dictionaries) {
            if (JSONDictionary == NSNull.null) {
                [models addObject:NSNull.null];
                continue;
            }
            
            id model = [dictionaryTransformer transformedValue:JSONDictionary];
            if (model == nil) {
                continue;
            } else {
                [models addObject:model];
            }
        }
        return models;
    } reverseBlock:^id(NSArray *models) {
        if (models == nil) {
            return nil;
        } else {
            NSMutableArray *dictionaries = [NSMutableArray arrayWithCapacity:models.count];
            for (id model in models) {
                if (model == NSNull.null) {
                    [dictionaries addObject:NSNull.null];
                    continue;
                }
                
                NSDictionary *dictionary = [dictionaryTransformer reverseTransformedValue:model];
                if (dictionary == nil) {
                    continue;
                } else {
                    [dictionaries addObject:dictionary];
                }
            }
            return dictionaries;
        }
    }];
}

#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"topOfLoop" : @"topofloop",
             @"busRouteColor" : @"buseroutecolor",
             @"stops" : @"stop"};
}

@end
