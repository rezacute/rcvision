//
//  RCController.m
//  RCVision
//
//  Created by Syah Riza on 3/30/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import "RCController.h"

@implementation RCController
+(RCController*) sharedInstance{
    static RCController* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RCController alloc] init];
        instance.currentPanel = SegueIdentifierFirst;
        instance.currentImage = [UIImage imageNamed:@"Balloon"];
    });
    
    return instance;
}
@end
