//
//  Stop.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface Stop : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *uniqueName;
@property (nonatomic, copy) NSString *humanName;
@property (nonatomic, copy) NSString *additionalName;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *heading;

@end
