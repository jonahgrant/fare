[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/c90b796cb40612af459840b74157e8a8 "githalytics.com")](http://githalytics.com/jonahgrant/fare)

# Fare
The University of Michigan has an awesome [live bus tracking system](http://mbus.pts.umich.edu/) for students.  This is an Objective-C wrapper around their [API](https://github.com/magic-bus/api-documentation/).

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like Fare in your projects.

If you don't already have CocoaPods, install it.

		gem install cocoapods
		pod install

#### Podfile

```ruby
platform :ios, '7.0'
pod "Fare", "~> 1.0"
```

## Usage

Where you want to use Fare, import the header file.

````objc
#import "UMNetworkingSession.h"
````

## Methods

- **<code>GET</code> `-fetchArrivalsWithSuccessBlock:errorBlock:`**
- **<code>GET</code> `-fetchBusesWithSuccessBlock:errorBlock:`**
- **<code>GET</code> `-fetchStopsWithSuccessBlock:errorBlock:`**
- **<code>GET</code> `-fetchRoutesWithSuccessBlock:errorBlock:`**
- **<code>GET</code> `-fetchAnnouncementsWithSuccessBlock:errorBlock:`**
- **<code>GET</code> `-fetchTraceRouteForRouteID:withSuccessBlock:errorBlock:`**

## Objects

##### Bus
| Property | Name    | Purpose   |
| -------- | --------| --------- |
| `NSString` | heading | heading of bus |
| `NSString` | id | the bus ID|
| `NSString`|latitude|current latitude of bus|
|`NSString`|longitude|current longitude of bus|
|`NSString`|routeID|the route ID that the bus is operating on|
|`NSString`|routeName|the name of the route that the bus is operating on|
|`NSString`|busRouteColor|a hex color representing route color|
##### Stop
| Property | Name    | Purpose   |
| -------- | --------| --------- |
|`NSString`|id|id of the stop|
|`NSString`|uniqueName|a stop's unique name|
|`NSString`|humanName|a stop's human name|
|`NSString`|additionalName|an extra name if a stop needs it|
|`NSString`|latitude|the latitude that the stop resides on|
|`NSString`|longitude|the longitude that the stop resides on|
|`NSString`|heading|the heading that the stop faces|
##### Route
| Property | Name    | Purpose   |
| -------- | --------| --------- |
|`NSString`|id|the route's ID|
|`NSString`|name|the name of the route|
|`NSString`|color|a hex color representing the route|
|`NSString`|topOfLoopStopID|ID of the stop that represents the route ending|
|`BOOL`|isActive|boolean representing if the route is operating|
|`NSArray`|stops|array of `Stop` objects that the route frequents|
##### Announcement
| Property | Name    | Purpose   |
| -------- | --------| --------- |
|`NSString`|title|title of the announcement|
|`NSString`|text|content of the announcement|
|`NSString`|type|type of announcement|
##### Arrival
| Property | Name    | Purpose   |
| -------- | --------| --------- |
|`NSString`|name|name of the route that is arriving|
|`NSString`|id|id of the arriving route|
|`NSString`|topOfLoop|id of stop that represents route ending|
|`NSString`|busRouteColor|hex color representing the arriving route|
|`NSArray`|stop|array of `ArrivalStop` objects that represents stops that the arriving route frequents|
##### ArrivalStop
| Property | Name    | Purpose   |
| -------- | --------| --------- |
|`NSString`|id1|first id|
|`NSString`|id2|second id|
|`NSString`|name|name of stop|
|`NSString`|name2|secondary name of stop|
|`NSString`|name3|third name of stop|
|`NSString`|latitude|latitude that the stop resides on|
|`NSString`|longitude|longitude that the stop resides on|
|`NSString`|heading|heading that the stop faces|
|`NSTimeInterval`|timeOfArrival|seconds until the bus arrives at this stop|
|`NSTimeInterval`|timeOfArrival2|seconds until the second bus arrives at this stop|
		
## Example

If I want to log the latitude and longitudes of each bus currently operating, I would import `UMNetworkingSession.h` and `Bus.h` into my header file.

In my `-viewDidLoad`, I would add:

````objc
    UMNetworkingSession *networkingSession = [[UMNetworkingSession alloc] init];
    [networkingSession fetchBusesWithSuccessBlock:^(NSArray *buses) {
        for (Bus *bus in buses) {
            NSLog(@"lat/lng: %@/%@", bus.latitude, bus.longitude);
        }
    } errorBlock:^(NSError *error) {
        NSLog(@"Error fetching buses: %@", error.localizedDescription);
    }];
````

## License

The MIT License (MIT)

Copyright (c) 2013 Jonah Grant.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
