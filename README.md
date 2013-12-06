# Fare
The University of Michigan has an awesome [live bus tracking system](http://mbus.pts.umich.edu/) for students.  This is an Objective-C wrapper around their [API](https://github.com/magic-bus/api-documentation/).

## Installation

If you don't have [Cocoapods](http://cocoapods.org), install it.

        gem install cocoapods
        pod setup
        
Install by adding `pod 'Fare'` to your `Podfile` and then run `pod install` to integrate it with your Xcode project.

## Usage

Where you want to use Fare, import the header file.

````objc
#import "UMNetworkingSession.h"
````

## Methods

- **<code>GET</code> -fetchArrivalsWithSuccessBlock:errorBlock:**
- **<code>GET</code> -fetchBusesWithSuccessBlock:errorBlock:**
- **<code>GET</code> -fetchStopsWithSuccessBlock:errorBlock:**
- **<code>GET</code> -fetchRoutesWithSuccessBlock:errorBlock:**
- **<code>GET</code> -fetchAnnouncementsWithSuccessBlock:errorBlock:**
- **<code>GET</code> -fetchTraceRouteForRouteID:withSuccessBlock:errorBlock:**

## Example

If I want to log the latitude and longitudes of each bus currently operating, I would import `UMNetworkingSession.h` and `Bus.h` into my header file.

In my `-viewDidLoad` I added:

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
