//
//  NewLocationViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NewLocationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *streetLabel;
@property (strong, nonatomic) IBOutlet UITextField *cityLabel;
@property (strong, nonatomic) IBOutlet UITextField *stateLabel;

@property (strong) NSString *descriptionString;
@property (strong) NSString *organization;
@property (strong) NSNumber *max;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *returnButton;
- (IBAction)returnButtonPressed:(id)sender;


@end
