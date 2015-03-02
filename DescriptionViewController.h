//
//  DescriptionViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DescriptionViewController : UIViewController

@property(strong, nonatomic)UIImageView *streetView;
@property(strong, nonatomic)UILabel *nameLabel;
@property(strong, nonatomic)UITextView *descriptionView;
@property(strong, nonatomic) UILabel *spotsAvailable;

@property(strong) PFObject *destinationObject;
@property NSNumber *spotsTaken;
- (IBAction)RSVPPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *availableLabel;
@property (strong, nonatomic) IBOutlet UILabel *takenLabel;


@end
