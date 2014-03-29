//
//  RCController.h
//  RCVision
//
//  Created by Syah Riza on 3/30/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SegueIdentifierFirst @"defaultPanel"
#define SegueIdentifierSecond @"grayscalePanel"
#define SegueForGausianBlur @"gaussianBlurPanel"

@class ContainerViewController;
@interface RCController : NSObject
@property(nonatomic,weak) ContainerViewController* containerVC;
@property (nonatomic,strong) NSString *currentPanel;
@property (nonatomic,strong) UIImage *currentImage;
+(RCController*) sharedInstance;
@end
