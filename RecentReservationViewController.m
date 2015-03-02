//
//  RecentReservationViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "RecentReservationViewController.h"

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
    self.nameLabel.text = string;
    
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

@end
