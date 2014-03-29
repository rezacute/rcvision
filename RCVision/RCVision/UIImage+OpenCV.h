//
//  UIImage+OpenCV.h
//  RCVision
//
//  Created by Syah Riza on 3/30/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OpenCV)
+ (UIImage *)imageWithCVMat:(const cv::Mat&)cvMat;
- (cv::Mat)CVMat;
- (cv::Mat)CVMat3;
- (cv::Mat)CVGrayscaleMat;
- (UIImage*) greyedImage;
@end
