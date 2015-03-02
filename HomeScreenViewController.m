//
//  HomeScreenViewController.m
//  HFTH
//
//  Created by Immanuel Amirtharaj on 2/28/15.
//  Copyright (c) 2015 Immanuel Amirtharaj. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "MenuTableViewCell.h"


@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.menuView = [[UITableView alloc] initWithFrame:CGRectMake(16, 244, 288, 395)];
    [self.menuView setDelegate:self];
    [self.menuView setDataSource:self];
    
    [self.view addSubview:self.menuView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellString = @"menuCell";
    
    MenuTableViewCell *cell = (MenuTableViewCell *) [self.menuView dequeueReusableCellWithIdentifier:cellString];
    
    
    if (!cell)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    if (indexPath.row == 0)
    {
        [cell.menuLabel setText:@"Make a Reservation"];
        [cell.menuImage setImage:[UIImage imageNamed:@"add139.png"]];
    }
    
    else if (indexPath.row == 1)
    {
        [cell.menuLabel setText:@"My Reservation"];
        [cell.menuImage setImage:[UIImage imageNamed:@"notes26.png"]];

    }
    
    else if (indexPath.row == 2)
    {
        [cell.menuLabel setText:@"Emergency Numbers"];
        [cell.menuImage setImage:[UIImage imageNamed:@"auricular6.png"]];

    }
    
    else if (indexPath.row == 3)
    {
        [cell.menuLabel setText:@"Settings"];
        [cell.menuImage setImage:[UIImage imageNamed:@"settings48.png"]];
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self performSegueWithIdentifier:@"slidingToReservation" sender:self];
    }
    
    if (indexPath.row == 1)
    {
        [self performSegueWithIdentifier:@"slidingToRecentReservation" sender:self];
    }
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
