//
//  CustomAnnotationPin.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

@interface CustomAnnotationPin : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) PFObject *object;

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

// Other methods and properties.
@end
