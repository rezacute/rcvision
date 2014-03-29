//
//  GaussianBlurViewController.m
//  RCVision
//
//  Created by Syah Riza on 3/30/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import "GaussianBlurViewController.h"
#import "UIImage+OpenCV.h"
#import <RESideMenu/RESideMenu.h>

@interface GaussianBlurViewController ()

@end

@implementation GaussianBlurViewController

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
-(IBAction)upadteSlider:(id)sender{
    int k_size = fmax(1, _slider.value);
    k_size = k_size % 2 == 0 ? k_size + 1 : k_size;
    
    float sigma = 0.3 * ((k_size - 1) * 0.5 - 1) + 0.8;
    cv::Mat gausianMat;
    cv::GaussianBlur([[RCController sharedInstance].currentImage CVMat], gausianMat, cv::Size(k_size,k_size), sigma);
    self.sideMenuViewController.backgroundImage = [UIImage imageWithCVMat:gausianMat];
    
}
-(void) viewWillDisappear:(BOOL)animated{
    _slider.value = 0.0;
}
@end
