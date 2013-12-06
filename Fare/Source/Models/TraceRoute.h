//
//  TraceRoute.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface TraceRoute : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *sequenceNumber;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;

@end
