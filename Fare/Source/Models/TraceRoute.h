//
//  TraceRoute.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 jonahgrant. All rights reserved.
//

#import "Mantle.h"

@interface TraceRoute : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *sequenceNumber, *latitude, *longitude;

@end
