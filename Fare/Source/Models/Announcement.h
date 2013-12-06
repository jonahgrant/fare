//
//  Announcement.h
//  Fare
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "Mantle.h"

@interface Announcement : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *type;

@end
