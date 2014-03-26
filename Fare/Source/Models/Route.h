//
//  Route.h
//  Fare
//
//  Created by Jonah Grant on 12/2/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface Route : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *id;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) UIColor *color;
@property (nonatomic, copy, readonly) NSString *topOfLoopStopID;
@property (nonatomic, readonly, getter = isActive) BOOL active;
@property (nonatomic, strong, readonly) NSArray *stops;
    
@end
