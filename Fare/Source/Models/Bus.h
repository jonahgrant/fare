//
//  Bus.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface Bus : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *heading;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *routeID;

@end
