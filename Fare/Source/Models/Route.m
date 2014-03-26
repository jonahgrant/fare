//
//  Route.m
//  Fare
//
//  Created by Jonah Grant on 12/2/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Route.h"
#import "Fare+UIColor.h"

@implementation Route

#pragma mark - NSValueTransformer

+ (NSValueTransformer *)colorJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *color) {
        return [UIColor colorFromHexString:color];
    } reverseBlock:^id(UIColor *color) {
        return [UIColor hexStringFromUIColor:color];
    }];
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"active" : @"is_active",
             @"topOfLoopStopID" : @"top_of_loop_stop_id"};
}

#pragma mark - NSObject

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"ID: %@\nName: %@\nColor: %@\nTop of loop stop ID: %@\n, Active: %@\nStops: %@",
            self.id,
            self.name,
            self.color,
            self.topOfLoopStopID,
            (self.isActive) ? @"YES" : @"NO",
            self.stops];
}

@end
