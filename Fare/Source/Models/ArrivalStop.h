//
//  ArrivalStop.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface ArrivalStop : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *id1;
@property (nonatomic, copy) NSString *id2;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *name2;
@property (nonatomic, copy) NSString *name3;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *heading;
@property (nonatomic) NSTimeInterval timeOfArrival
@property (nonatomic) NSTimeInterval timeOfArrival2;

@end
