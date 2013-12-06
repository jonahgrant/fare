//
//  Arrival.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 jonahgrant. All rights reserved.
//

#import "Mantle.h"

@interface Arrival : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *name, *id, *topOfLoop, *busRouteColor;
@property (strong, nonatomic) NSArray *stops;

@end
