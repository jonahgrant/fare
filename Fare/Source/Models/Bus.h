//
//  Bus.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface Bus : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *heading, *id, *latitude, *longitude, *routeID, *routeName, *busRouteColor;

@end
