//
//  UMResponseSerializer.h
//  UMBus
//
//  Created by Jonah Grant on 12/1/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import "AFURLResponseSerialization.h"
#import "MTLModel.h"

extern NSString * const LTCResponseSerializerErrorDomain;

@interface UMJSONResponseSerializer : AFJSONResponseSerializer

@end

@interface UMXMLResponseSerializer : AFXMLParserResponseSerializer

@end

@interface MTLModel (UMJSONResponseSerializer)

+ (UMJSONResponseSerializer *)um_jsonResponseSerializer;
+ (UMJSONResponseSerializer *)um_jsonArrayResponseSerializer;

+ (UMXMLResponseSerializer *)um_xmlResponseSerializer;
+ (UMXMLResponseSerializer *)um_xmlArrayResponseSerializer;

@end
