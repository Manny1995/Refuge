//
//  MainDashboardViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 3/1/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainDashboardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) UITableView *menuView;
@end
