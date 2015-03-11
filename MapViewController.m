//
//  MapViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "MapViewController.h"
#import "math.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>
#import "CustomAnnotationPin.h"
#import "DescriptionViewController.h"

CLLocation *currentLocation;
NSMutableArray *closestLocationsArray;
NSMutableArray *annotationArray;
PFObject *sendObject;


@interface MapViewController ()

@end

@implementation MapViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization]; // Add This Line

//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//    {
//        [self.locationManager requestAlwaysAuthorization];
//        [self.locationManager requestWhenInUseAuthorization];
//    }
//    

    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    [self.mapView setDelegate:self];
    
    [self.mapView setScrollEnabled:YES];
    [self.mapView setPitchEnabled:YES];
    [self.mapView setMultipleTouchEnabled:YES];
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setShowsUserLocation:YES];    // SHOWS THE USER LOCATION
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];

    [self.view addSubview:self.mapView];
    
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
    currentLocation = [[CLLocation alloc] init];
    [self.mapView setShowsUserLocation:YES];
    
    
    [self.locationManager startUpdatingLocation];
    [self updateLocation];
    
    [self retrieveFromParse];
    [self reloadPins];

}

-(void) retrieveFromParse
{
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"Posted_Reservations"];
    //[query findObjects];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        closestLocationsArray = [[NSMutableArray alloc] initWithArray:objects];
        [self reloadPins];
        
        
    }];

}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    [self.locationManager startUpdatingLocation];
    [self.mapView setShowsUserLocation:YES];
    [self updateLocation];
}

-(void)updateLocation
{

    [self.locationManager startUpdatingLocation];

    NSLog(@"%f, %f\n", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
    
    
    currentLocation = self.locationManager.location;
    
    NSLog(@"%f, %f", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
    double scalingFactor = ABS( (cos(2 * M_PI * currentLocation.coordinate.latitude / 360.0) ));
    double spanX = 0.001/1000.0;
    double spanY = 0.001/(scalingFactor * 1000.0);
    
    MKCoordinateSpan span;
    span.latitudeDelta = spanX;
    span.longitudeDelta = spanY;
    
    
    MKCoordinateRegion region;
    region.center.latitude = currentLocation.coordinate.latitude;
    region.center.longitude = currentLocation.coordinate.longitude;
    
    
    region.span = span;
    
    
    [self.mapView setRegion:region animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)reloadPins
{
    
    
    for (NSUInteger i = 0; i < [closestLocationsArray count]; i++)
    {
        PFObject *object = [closestLocationsArray objectAtIndex:i];

        PFGeoPoint *geoPoint = object[@"Location"];
        
        CLLocation *location = [[CLLocation alloc] initWithLatitude:geoPoint.latitude longitude:geoPoint.longitude];
        
        CustomAnnotationPin *annotation = [[CustomAnnotationPin alloc] initWithLocation:location.coordinate];

        
        [annotation setObject:[closestLocationsArray objectAtIndex:i]];
        //[annotation setTitle:object[@"Name"]];
        
        NSLog(@"@%@", annotation.object);
        
        if (annotationArray == nil)
            annotationArray = [[NSMutableArray alloc] initWithObjects:annotation, nil];
        else
        [annotationArray addObject:annotation];
        
        [self.mapView addAnnotation:annotation];

    }
    
    
    
}

-(void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    CustomAnnotationPin *compare = view.annotation;
    
    sendObject = compare.object;
    
    
    
    [self performSegueWithIdentifier:@"slidingToDescription" sender:self];
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    DescriptionViewController *destination = [segue destinationViewController];
    destination.destinationObject = sendObject;
    
}


@end
