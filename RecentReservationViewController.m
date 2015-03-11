//
//  RecentReservationViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "RecentReservationViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

NSNumber *latitude, *longitude;

@interface RecentReservationViewController ()

@end

@implementation RecentReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSData *imageData = [defaults dataForKey:@"image"];
    UIImage *contactImage = [UIImage imageWithData:imageData];
    NSString *string = [defaults stringForKey:@"name"];
    latitude = [defaults objectForKey:@"latitude"];
    longitude = [defaults objectForKey:@"longitude"];
    
    
    
    if (string == nil)
        self.nameLabel.text = @"No Reservations";
    else
        self.nameLabel.text = string;

    
    if (imageData == nil)
        [self.QRCode setImage:[UIImage imageNamed:@"not2.png"]];

    else
        [self.QRCode setImage:contactImage];
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

- (IBAction)phoneButtonPressed:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4088874946"]];

}

- (IBAction)navigationButtonPressed:(id)sender {
    

    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = (CLLocationDegrees) [latitude doubleValue];
    coordinate.longitude = (CLLocationDegrees)[longitude doubleValue];
    
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        
        MKPlacemark* placeMark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
        MKMapItem* destination =  [[MKMapItem alloc] initWithPlacemark:placeMark];
        
        if([destination respondsToSelector:@selector(openInMapsWithLaunchOptions:)])
        {
            [destination openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking}];
        }
    }

}

- (IBAction)infoButtonPressed:(id)sender {
    
    
    
}

- (IBAction)cancelReservationButtonPressed:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"image"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"longitude"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Reservation deleted!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];


}
@end
