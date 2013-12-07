//
//  Constants.h
//  Fare
//
//  Created by Jonah Grant on 12/5/13.
//  Copyright (c) 2013 Jonah Grant. All rights reserved.
//

#pragma API Root

static NSString * kUMRootURL                    = @"http://mbus.pts.umich.edu/";

#pragma Legacy XML API

static NSString * kUMAPIFetchArrivals           = @"shared/public_feed.xml";
static NSString * kUMAPIFetchBuses              = @"shared/location_feed.xml";
static NSString * kUMAPIFetchTraceRoute         = @"shared/map_trace_route_%@.xml";

#pragma JSON API

static NSString * kUMAPIFetchAnnouncements      = @"api/v0/announcements";
static NSString * kUMAPIFetchRoutes             = @"api/v0/routes";
static NSString * kUMAPIFetchStops              = @"api/v0/stops";

#pragma Tags

static NSString * kError                        = @"error";
static NSString * kResponse                     = @"response";
static NSString * kXMLName                      = @"__name";
static NSString * kLiveFeed                     = @"livefeed";
static NSString * kRoute                        = @"route";
static NSString * kItem                         = @"item";
static NSString * kHistoricalData               = @"histdata";