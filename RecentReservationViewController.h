//
//  RecentReservationViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentReservationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *QRCode;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)phoneButtonPressed:(id)sender;
- (IBAction)navigationButtonPressed:(id)sender;
- (IBAction)infoButtonPressed:(id)sender;
@end
