//
//  DirectionsViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DirectionsViewController : UIViewController
@property (strong) UIButton *mapButton;
@property (strong) UIButton *uberButton;
@property PFGeoPoint *targetPoint;
@property NSString *objectID;
@property(strong, nonatomic) UIImageView *qrImageView;
@property NSString *nameID;

- (IBAction)reserveButtonPressed:(id)sender;

@end
