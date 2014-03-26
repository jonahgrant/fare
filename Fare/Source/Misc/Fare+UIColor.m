//
//  Fare+UIColor.m
//  Fare
//
//  Created by Jonah Grant on 3/26/14.
//  Copyright (c) 2014 jonahgrant. All rights reserved.
//

#import "Fare+UIColor.h"

@implementation UIColor (Fare)

+ (UIColor *)colorFromHexString:(NSString *)string {
    if ([string length] != 6) {
        return nil;
    }
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^a-fA-F|0-9]" options:0 error:NULL];
    NSUInteger match = [regex numberOfMatchesInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, [string length])];
    
    if (match != 0) {
        return nil;
    }
    
    NSRange redRange = NSMakeRange(0, 2);
    NSString *redComponent = [string substringWithRange:redRange];
    unsigned int redValue = 0;
    NSScanner *redScanner = [NSScanner scannerWithString:redComponent];
    [redScanner scanHexInt:&redValue];
    float redRetValue = (float)redValue / 254;
    
    NSRange greenRange = NSMakeRange(2, 2);
    NSString *greebComponent = [string substringWithRange:greenRange];
    unsigned int greenValue = 0;
    NSScanner *greenScanner = [NSScanner scannerWithString:greebComponent];
    [greenScanner scanHexInt:&greenValue];
    float greenRetValue = (float)greenValue / 254;
    
    NSRange blueRange = NSMakeRange(4, 2);
    NSString *blueComponent = [string substringWithRange:blueRange];
    unsigned int blueValue = 0;
    NSScanner *blueScanner = [NSScanner scannerWithString:blueComponent];
    [blueScanner scanHexInt:&blueValue];
    float blueRetValue = (float)blueValue / 254;
    
    return [UIColor colorWithRed:redRetValue green:greenRetValue blue:blueRetValue alpha:1.0f];
}

+ (NSString *)hexStringFromUIColor:(UIColor *)color {
    if (!color) {
        return nil;
    }
    
    if (color == [UIColor whiteColor]) {
        return @"ffffff";
    }
    
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    int redDec = (int)(red * 255);
    int greenDec = (int)(green * 255);
    int blueDec = (int)(blue * 255);
    
    NSString *returnString = [NSString stringWithFormat:@"%02x%02x%02x", (unsigned int)redDec, (unsigned int)greenDec, (unsigned int)blueDec];
    
    return returnString;
}

@end
