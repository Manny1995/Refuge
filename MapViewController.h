//
//  MapViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, MKAnnotation>

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
