//
//  GaussianBlurViewController.h
//  RCVision
//
//  Created by Syah Riza on 3/30/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GaussianBlurViewController : UIViewController
@property(nonatomic,weak) IBOutlet UISlider *slider;
-(IBAction)upadteSlider:(id)sender;
@end
