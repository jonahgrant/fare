//
//  ArrivalStop.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface ArrivalStop : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *id1, *id2, *name, *name2, *name3, *latitude, *longitude, *heading;
@property (nonatomic) NSTimeInterval timeOfArrival, timeOfArrival2;

@end
