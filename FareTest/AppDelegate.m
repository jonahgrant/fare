//
//  AppDelegate.m
//  FareTest
//
//  Created by Jonah Grant on 12/7/13.
//  Copyright (c) 2013 jonahgrant. All rights reserved.
//

#import "AppDelegate.h"
#import "UMNetworkingSession.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
