//
//  Arrival.m
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Arrival.h"
#import "ArrivalStop.h"
#import "Fare+UIColor.h"

@implementation Arrival

#pragma mark - NSValueTransformer

+ (NSValueTransformer *)stopsJSONTransformer {
    NSValueTransformer *dictionaryTransformer = [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[ArrivalStop class]];
    
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

+ (NSValueTransformer *)routeColorJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *color) {
        return [UIColor colorFromHexString:color];
    } reverseBlock:^id(UIColor *color) {
        return [UIColor hexStringFromUIColor:color];
    }];
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"topOfLoop" : @"topofloop",
             @"routeColor" : @"busroutecolor",
             @"stops" : @"stop"};
}

#pragma mark - NSObjet

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"Name: %@\nID: %@\ntopOfLoop: %@\nRoute color: %@\nStops: %@", self.name, self.id, self.topOfLoop, self.routeColor, self.stops];
}

@end
