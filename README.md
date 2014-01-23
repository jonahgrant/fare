# Fare 
The University of Michigan has an awesome [live bus tracking system](http://mbus.pts.umich.edu/) for students.  This is an Objective-C wrapper around the API
[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/c90b796cb40612af459840b74157e8a8 "githalytics.com")](http://githalytics.com/jonahgrant/fare)
### Dependencies

Fare runs with the help of a couple awesome projects.  

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) 
- [Mantle](https://github.com/github/Mantle) 
- [XMLDictionary](https://github.com/nicklockwood/XMLDictionary)
- [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)

### Installation with CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like Fare in your projects.

If you don't already have CocoaPods, install it.

		gem install cocoapods
		pod install

#### Podfile

```ruby
platform :ios, '7.0'
pod 'Fare', '~> 1.0.2'
```

## Usage

Where you want to use Fare, import the header file.

````obj-c
#import "UMNetworkingSession.h"
````

## Methods

**GET** `-fetchArrivalsWithSuccessBlock:errorBlock:`

**GET** `-fetchBusesWithSuccessBlock:errorBlock:`

**GET** `-fetchStopsWithSuccessBlock:errorBlock:`

**GET** `-fetchRoutesWithSuccessBlock:errorBlock:`

**GET** `-fetchAnnouncementsWithSuccessBlock:errorBlock:`

**GET** `-fetchTraceRouteForRouteID:withSuccessBlock:errorBlock:`

## Usage

If I want to log the latitude and longitudes of each bus currently operating, I would import `UMNetworkingSession.h` and `Bus.h` into my implementation.

````obj-c
    UMNetworkingSession *networkingSession = [[UMNetworkingSession alloc] init];
    [networkingSession fetchBusesWithSuccessBlock:^(NSArray *buses) {
        for (Bus *bus in buses) {
            NSLog(@"lat/lng: %@/%@", bus.latitude, bus.longitude);
        }
    } errorBlock:^(NSError *error) {
        NSLog(@"There was an error fetching buses: %@", error.localizedDescription);
    }];
````

## Objects

### Bus
| Property   |	Name    		|	Purpose   |
| --------   |	--------		|	--------- |
| `NSString` |	heading 		|	heading of bus |
| `NSString` |	id				| 	the bus ID|
| `NSString` |	latitude		|	current latitude of bus|
| `NSString` |	longitude		|	current longitude of bus|
| `NSString` |	routeID			|	the route ID that the bus is operating on|
| `NSString` |	routeName		|	the name of the route that the bus is operating on|
| `NSString` |	busRouteColor	|	a hex color representing route color|

### Stop
| Property 	|	Name    		|	Purpose   												|
| -------- 	|	--------		|	--------- 												|
|`NSString`	|	id				|	Returns the stop's ID									|
|`NSString`	|	uniqueName		|	Returns the stop's unique name							|
|`NSString`	|	humanName		|	Returns the stop's human name							|
|`NSString`	|	additionalName	|	Returns the stop's additional name, if it has one		|
|`NSString`	|	latitude		|	Returns the latitude that the stop resides on			|
|`NSString`	|	longitude		|	Returns the longitude that the stop resides on			|
|`NSString`	|	heading			|	Returns the heading that the stop is directing towards	|

`-coordinate` will return a `CLLocationCoordinate2D` representation of the stop's location

### Route
| Property 	|	Name   			|	Purpose   											|
| -------- 	|	--------		|	--------- 											|
|`NSString`	|	id				|	the route's ID										|
|`NSString`	|	name			|	the name of the route								|
|`NSString`	|	color			|	a hex color representing the route					|
|`NSString`	|	topOfLoopStopID	|	ID of the stop that represents the route ending		|
|`BOOL`		|	isActive		|	boolean representing if the route is operating		|
|`NSArray`	|	stops			|	array of `Stop` objects that the route frequents	|

### Announcement
Returned in an array as a `-fetchAnnouncementsWithSuccessBlock:errorBlock:` response.  Each object represents an active announcement.

| Property |	Name    |	Purpose   						|
| -------- |	------- |	--------- 						|
|`NSString`|	title	|	title of the announcement		|
|`NSString`|	text	|	content of the announcement		|
|`NSString`|	type	|	type of announcement			|

### Arrival
Returned in an array as a `-fetchArrivalsWithSuccessBlock:errorBlock:` response.  Each object represents a route that is being serviced.

| Property 	| 	Name    		|	 Purpose 																|   
| -------- 	|	 --------		|	 --------- 																|
|`NSString`	|	name			|	Returns the route name													|
|`NSString`	|	id				|	Returns the id of the route												|
|`NSString`	|	topOfLoop		|	Returns the id of the stop that the route "repeats" on					|
|`NSString`	|	busRouteColor	|	Returns the hex representation route's designated color					|
|`NSArray`	|	stops			|	Returns an NSArray of ArrivalStop objects that the route is servicing	|

`-stopClosestToCoordinate:` will return the geographically closest `ArrivalStop` object in `stops` to a passed `CLLocationCoordinate2D`

### ArrivalStop
| Property 			|	 Name    		|	Purpose   														|
| -------- 			| 	--------		|	--------- 														|
|`NSString`			|	id1				|	The stop has two different IDs, this returns the first one 		|
|`NSString`			|	id2				|	The stop has two different IDs, this returns the second one		|
|`NSString`			|	name			|	The stop has three different names, this returns the first one	|
|`NSString`			|	name2			|	The stop has three different names, this returns the second one	|
|`NSString`			|	name3			|	The stop has three different names, this returns the third one	|
|`NSString`			|	latitude		|	Returns the latitude that the stop resides on					|
|`NSString`			|	longitude		|	Returns the longitude that the stop resides on					|
|`NSString`			|	heading			|	Returns the heading that the stop is directing towards			|
|`NSTimeInterval`	|	timeOfArrival	|	Returns the number of seconds until the first bus arrives		|
|`NSTimeInterval`	|	timeOfArrival2	|	Returns the number of seconds until the second bus arrives		|
		
`-coordinate` will return a `CLLocationCoordinate2D` representation of the stop's location
`-dateForTimeOfArrival:` will return a `NSDate` representation of when a passed `NSTimeInterval` will occur
`-timerCountingDownToTimeOfArrival:` will return an `NSTimer` set to execute once a passed `NSTimeInterval` has passed

## License
````
The MIT License (MIT)

Copyright (c) 2014 Jonah Grant.

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
````