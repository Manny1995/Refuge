//
//  HomeScreenViewController.h
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScreenViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) UITableView *menuView;

@end
