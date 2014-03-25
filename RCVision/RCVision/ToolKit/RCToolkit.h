//
//  RCToolkit.h
//  RCVision
//
//  Created by Syah Riza on 3/24/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCToolkit : NSObject
/** Convert UIImage to cv::Mat.
 @param image an UIImage instance
 @return cv::Mat
 */
- (cv::Mat) cvMatFromUIImage:(UIImage *)image;
/** Convert given UIImage to gray scale image
 @param image an Instance of UIImage.
 @return converted image.
 */
-(UIImage*) convertToGray:(UIImage*) image;
@end
