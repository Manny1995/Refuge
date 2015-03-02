//
//  DirectionsViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "DirectionsViewController.h"
#import <MapKit/MapKit.h>
#import "UIImage+MDQRCode.h"
#import "MapViewController.h"

@interface DirectionsViewController ()

@end

@implementation DirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapButton = [[UIButton alloc] initWithFrame:CGRectMake(140, 530, 100, 100)];
    [self.mapButton setImage:[UIImage imageNamed:@"location74.png"] forState:UIControlStateNormal];
    [self.mapButton addTarget:self action:@selector(mapButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.mapButton];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40)];
    
    [label setText:@"Success!"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label];
    
    
    UITextView *showlabel =[[UITextView alloc] initWithFrame:CGRectMake(60, 420, [UIScreen mainScreen].bounds.size.width - 120, 100)];
    [showlabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:15]];
    [showlabel setTextAlignment:NSTextAlignmentCenter];
    [showlabel setText:@"Show this QR code when you arrive at you're destination to get checked in! Click below to get directions as well."];
    [self.view addSubview:showlabel];
    
    
    
    self.qrImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 150, [UIScreen mainScreen].bounds.size.width - 120, [UIScreen mainScreen].bounds.size.width-120)];
    
    [self.view addSubview:self.qrImageView];

    self.qrImageView.image = [UIImage mdQRCodeForString:self.objectID size:self.qrImageView.bounds.size.width fillColor:[UIColor blackColor]];

    //NSData *data = UIImagePNGRepresentation(self.qrImageView.image);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

     
-(void)mapButtonPressed
{
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.targetPoint.latitude, self.targetPoint.longitude);
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
//        // Create an MKMapItem to pass to the Maps app
//        CLLocationCoordinate2D coordinate =
//        CLLocationCoordinate2DMake(16.775, -3.009);
//        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
//                                                       addressDictionary:nil];
//        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//        [mapItem setName:@"Target Destination"];
//        // Pass the map item to the Maps app
//        [mapItem openInMapsWithLaunchOptions:nil];
        
        MKPlacemark* placeMark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
        MKMapItem* destination =  [[MKMapItem alloc] initWithPlacemark:placeMark];
        
        if([destination respondsToSelector:@selector(openInMapsWithLaunchOptions:)])
        {
            [destination openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking}];
        }
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)reserveButtonPressed:(id)sender {
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *imageData = UIImageJPEGRepresentation(self.qrImageView.image, 100);

    [defaults setObject:imageData forKey:@"image"];
    [defaults setObject:self.nameID forKey:@"name"];
//    [defaults setObject:description forKey:@"lastname"];
//    [defaults setInteger:age forKey:@"age"];
//    [defaults setObject:imageData forKey:@"image"];
    [defaults synchronize];

    UIViewController *cont = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"homeScreen"];
    self.navigationController.viewControllers = @[cont];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
