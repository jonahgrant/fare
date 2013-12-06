//
//  Arrival.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface Arrival : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *id
@property (nonatomic, copy) NSString *topOfLoop
@property (nonatomic, copy) NSString *busRouteColor;
@property (strong, nonatomic) NSArray *stops;

@end
