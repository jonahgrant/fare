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

- (ArrivalStop *)stopClosestToCoordinate:(CLLocationCoordinate2D)coordinate {
    NSArray *sortedStops = [self.stops sortedArrayUsingComparator: ^(id a, id b) {
        ArrivalStop *stop1 = (ArrivalStop *)a;
        ArrivalStop *stop2 = (ArrivalStop *)b;
        
        CLLocation *destination = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        CLLocation *stop1Location = [[CLLocation alloc] initWithLatitude:[stop1.latitude doubleValue] longitude:[stop1.longitude doubleValue]];
        CLLocation *stop2Location = [[CLLocation alloc] initWithLatitude:[stop2.latitude doubleValue] longitude:[stop2.longitude doubleValue]];
        
        CLLocationDistance dist_a = [stop1Location distanceFromLocation:destination];
        CLLocationDistance dist_b = [stop2Location distanceFromLocation:destination];
        
        if (dist_a < dist_b) {
            return (NSComparisonResult)NSOrderedAscending;
        } else if (dist_a > dist_b) {
            return (NSComparisonResult)NSOrderedDescending;
        } else {
            return (NSComparisonResult)NSOrderedSame;
        }
    }];
    
    return sortedStops.firstObject;
}

#pragma mark - Value Transformers

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
