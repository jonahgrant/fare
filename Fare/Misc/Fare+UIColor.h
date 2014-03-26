//
//  Fare+UIColor.h
//  Fare
//
//  Created by Jonah Grant on 3/26/14.
//  Copyright (c) 2014 jonahgrant. All rights reserved.
//

@import UIKit;

@interface UIColor (Fare)

+ (UIColor *)colorFromHexString:(NSString *)string;
+ (NSString *)hexStringFromUIColor:(UIColor *)color;

@end
