//
//  NewLocationViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "NewLocationViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>


CLGeocoder *geocoder;
CLPlacemark *placemark;


@interface NewLocationViewController ()

@end

@implementation NewLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    geocoder = [[CLGeocoder alloc] init];
    
}


-(void)saveLocationPressed
{
    
    PFObject *reservationObject = [[PFObject alloc] initWithClassName:@"Posted_Reservations"];
    
    
    reservationObject[@"Total_Spots"] = self.max;
    reservationObject[@"Description"] = self.descriptionString;
    reservationObject[@"Name"] = self.organization;
    NSNumber *number = [NSNumber numberWithInteger:0];
    reservationObject[@"Taken_Spots"] = number;
    
    
    
    
    
    
    
    
    NSString *addressString = self.streetLabel.text;
    

    addressString = [NSString stringWithFormat:@"%@%@", addressString, self.cityLabel.text];

    addressString = [NSString stringWithFormat:@"%@, ", addressString];
    
    addressString = [NSString stringWithFormat:@"%@%@", addressString, self.stateLabel.text];
    
    NSLog(@"%@", addressString);
    
    [geocoder geocodeAddressString:addressString
                 completionHandler:^(NSArray* placemarks, NSError* error){
//                     for (CLPlacemark* aPlacemark in placemarks)
//                     {
//                         
//                     }
                     placemark = [placemarks objectAtIndex:0];
                     
                     PFGeoPoint *point = [[PFGeoPoint alloc] init];
                     point.latitude = placemark.location.coordinate.latitude;
                     point.longitude = placemark.location.coordinate.longitude;
                     
                     reservationObject[@"Location"] = point;
                     [reservationObject saveInBackground];
                     
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You were successfully able to register your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                     [alert show];
                     
                
                     [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)returnButtonPressed:(id)sender {
    [self saveLocationPressed];
}
@end
