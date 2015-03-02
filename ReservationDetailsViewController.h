//
//  ReservationDetailsViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *organizationLabel;
@property (strong, nonatomic) IBOutlet UITextField *maxCapacityLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
- (IBAction)nextButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@end
