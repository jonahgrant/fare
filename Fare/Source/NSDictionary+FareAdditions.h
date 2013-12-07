//
//  NSDictionary+FareAdditions.h
//  Fare
//
//  Created by Jonah Grant on 12/7/13.
//  Copyright (c) 2013 jonahgrant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FareAdditions)

+ (NSDictionary *)dictionaryForXMLData:(NSData *)data error:(NSError **)errorPointer;

@end