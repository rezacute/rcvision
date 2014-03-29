//
//  RCMenuViewController.h
//  RCVision
//
//  Created by Syah Riza on 3/30/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RESideMenu/RESideMenu.h>
#import "ContainerViewController.h"

@interface RCMenuViewController : UITableViewController
-(IBAction)toDefault:(id)sender;
-(IBAction)toGreyscale:(id)sender;
-(IBAction)toGaussian:(id)sender;
@end
