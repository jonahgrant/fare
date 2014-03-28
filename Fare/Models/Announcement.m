//
//  Announcement.m
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Announcement.h"
#import "Fare+UIColor.h"

@implementation Announcement

#pragma mark - NSValueTransformer

+ (NSValueTransformer *)colorJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *color) {
        return [UIColor colorFromHexString:[color stringByReplacingOccurrencesOfString:@"#" withString:@""]];
    } reverseBlock:^id(UIColor *color) {
        return [UIColor hexStringFromUIColor:color];
    }];
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

#pragma mark - NSObject

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"Title: %@\nText: %@\nType: %@\nColor: %@", self.title, self.text, self.type, self.color];
}

@end
