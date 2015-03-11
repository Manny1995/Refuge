//
//  DescriptionViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "DescriptionViewController.h"
#import "DirectionsViewController.h"
#import <Parse/Parse.h>

NSNumber *spotsAvailable;
NSString *name;
NSString *description;
PFGeoPoint *destinationPoint;
UIImage *qrImage;

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 50)];
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:30]];
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
     self.descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(16, 360, [UIScreen mainScreen].bounds.size.width - 32, 100)];
    [self.descriptionView setEditable:NO];
    [self.descriptionView setSelectable:NO];
    [self.descriptionView setTextAlignment:NSTextAlignmentCenter];
    [self.descriptionView setFont:[UIFont fontWithName:@"HelveticaNeue" size:20]];
   
    [self.view addSubview:self.descriptionView];
    [self.view addSubview:self.nameLabel];
    
    
    // Setting all the UI elements from Parse
  //  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        name = [self.destinationObject objectForKey:@"Name"];
        description = [self.destinationObject objectForKey:@"Description"];
    spotsAvailable = self.destinationObject[@"Total_Spots"];
    self.spotsTaken = self.destinationObject[@"Available_Spots"];
    
    
    [self.nameLabel setText:name];
    [self.descriptionView setText:description];
    
    NSNumber *taken = self.destinationObject[@"Taken_Spots"];
    NSNumber *total = self.destinationObject[@"Total_Spots"];
    
    [self.availableLabel setText:[NSString stringWithFormat:@"%@", taken]];
    [self.takenLabel setText:[NSString stringWithFormat:@"%@", total]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)RSVPPressed:(id)sender {
    if ((self.spotsTaken) == spotsAvailable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"This location has filled up. Please try another!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    else
    {
        [self performSegueWithIdentifier:@"slidingToConfirmation" sender:self];
    }

}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
    
     NSString *objectString = [self.destinationObject objectId];
     NSString *nameString = [self.destinationObject objectForKey:@"Name"];
     DirectionsViewController *destination = [segue destinationViewController];
     destinationPoint = self.destinationObject[@"Location"];
     destination.targetPoint = destinationPoint;
     destination.objectID = objectString;
     destination.nameID = nameString;

     NSLog(@"@%@", objectString);
 
 }


@end
