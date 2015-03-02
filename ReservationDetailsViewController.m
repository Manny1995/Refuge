//
//  ReservationDetailsViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "ReservationDetailsViewController.h"
#import <Parse/Parse.h>
#import "NewLocationViewController.h"
UIButton *confirmButton;
NSString *organization;
NSString *description;
NSNumber *max;
PFObject *object;

@interface ReservationDetailsViewController ()

@end

@implementation ReservationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.descriptionTextView.layer.borderWidth = 1.0f;
    self.descriptionTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
}

-(void)confirmButtonPressed
{
    organization = self.organizationLabel.text;
    description = self.descriptionTextView.text;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterNoStyle;
    max = [f numberFromString:self.maxCapacityLabel.text];
    
   
    [self performSegueWithIdentifier:@"slidingToNewLocation" sender:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NewLocationViewController *destination = [segue destinationViewController];
    
    destination.max = max;
    destination.descriptionString = description;
    destination.organization = organization;
    
}


- (IBAction)nextButtonPressed:(id)sender {
    [self confirmButtonPressed];

}
@end
