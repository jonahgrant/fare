//
//  DataStore.h
//  UMBus
//
//  Created by Jonah Grant on 12/3/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#import <MapKit/MapKit.h>

@class Stop, Route;

@interface DataStore : NSObject

@property (strong, nonatomic, readonly) NSArray *buses, *routes, *stops, *announcements;

+ (instancetype)sharedManager;

- (void)fetchAll;
- (void)fetchBuses;
- (void)fetchRoutes;
- (void)fetchStops;
- (void)fetchAnnouncements;

- (void)fetchBusesIfNil;
- (void)fetchRoutesIfNil;
- (void)fetchStopsIfNil;
- (void)fetchAnnouncementsIfNil;

- (NSArray *)routesServicingStop:(Stop *)stop;

@end
