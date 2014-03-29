//
//  RCMenuViewController.m
//  RCVision
//
//  Created by Syah Riza on 3/30/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import "RCMenuViewController.h"

@interface RCMenuViewController ()

@end

@implementation RCMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)toDefault:(id)sender{
    [RCController sharedInstance].currentPanel=SegueIdentifierFirst;
    [self closeMenu];
}
-(void) closeMenu{
    [[RCController sharedInstance].containerVC changePanel];
    [self.sideMenuViewController hideMenuViewController];
}
-(IBAction)toGreyscale:(id)sender{
    [RCController sharedInstance].currentPanel=SegueIdentifierSecond;
    [self closeMenu];
}

-(IBAction)toGaussian:(id)sender{
    [RCController sharedInstance].currentPanel=SegueForGausianBlur;
    [self closeMenu];
}
@end
