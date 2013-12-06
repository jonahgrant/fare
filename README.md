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
| NSString | heading | heading of bus |
| NSString | id | id of bus|
| NSString|latitude|current latitude of bus|
|NSString|longitude|current longitude of bus|

	* <code>NSString</code> heading
	* <code>NSString</code> id
	* <code>NSString</code> latitude
	* <code>NSString</code> longitude
	* <code>NSString</code> routeID
	* <code>NSString</code> routeName
	* <code>NSString</code> busRouteColor
##### `Stop`
	* <code>NSString</code> id
	* <code>NSString</code> uniqueName
	* <code>NSString</code> humanName
	* <code>NSString</code> additionalName
	* <code>NSString</code> latitude
	* <code>NSString</code> longitude
	* <code>NSString</code> heading
##### `Route`
	* <code>NSString</code> id
	* <code>NSString</code> name 
	* <code>NSString</code> color
	* <code>NSString</code> topOfLoopStopID
	* <code>BOOL</code> isActive
	* <code>NSArray</code> stops
##### `Announcement`
	* <code>NSString</code> title
	* <code>NSString</code> text
	* <code>NSString</code> type
##### `Arrival`
	* <code>NSString</code> name
	* <code>NSString</code> id
	* <code>NSString</code> topofLoop
	* <code>NSString</code> busRouteColor
	* <code>NSArray</code> stops
	###### `ArrivalStop`
		* <code>NSString</code> id1
		* <code>NSString</code> id2
		* <code>NSString</code> name
		* <code>NSString</code> name2
		* <code>NSString</code> name3
		* <code>NSString</code> latitude
		* <code>NSString</code> longitude
		* <code>NSString</code> heading
		* <code>NSTimeInterval</code> timeOfArrival
		* <code>NSTimeInterval</code> timeOfArrival2
		
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

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/c90b796cb40612af459840b74157e8a8 "githalytics.com")](http://githalytics.com/jonahgrant/fare)
