//
//  ContainerViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 11/13/12.
//  Copyright (c) 2012 Sandmoose Software. All rights reserved.
//  Heavily inspired by http://orderoo.wordpress.com/2012/02/23/container-view-controllers-in-the-storyboard/
//

#import "ContainerViewController.h"
#import "DefaultPanelViewController.h"
#import "GreyscalePanelViewController.h"
#import "GaussianBlurViewController.h"


@interface ContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) DefaultPanelViewController *defaultPanelViewController;
@property (strong, nonatomic) GreyscalePanelViewController *greyscalePanelViewController;
@property (strong, nonatomic) GaussianBlurViewController *gaussianBlurPanelViewController;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.transitionInProgress = NO;
    [RCController sharedInstance].containerVC = self;
    self.currentSegueIdentifier = [RCController sharedInstance].currentPanel;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if (([segue.identifier isEqualToString:SegueIdentifierFirst]) && !self.defaultPanelViewController) {
        self.defaultPanelViewController = segue.destinationViewController;
    }

    if (([segue.identifier isEqualToString:SegueIdentifierSecond]) && !self.greyscalePanelViewController) {
        self.greyscalePanelViewController = segue.destinationViewController;
    }

    if (([segue.identifier isEqualToString:SegueForGausianBlur]) && !self.gaussianBlurPanelViewController) {
        self.gaussianBlurPanelViewController = segue.destinationViewController;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:SegueIdentifierFirst]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.defaultPanelViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    // By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.greyscalePanelViewController];
    }
    else if ([segue.identifier isEqualToString:SegueForGausianBlur]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.gaussianBlurPanelViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];

    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

-(void) changePanel{
    if (self.currentSegueIdentifier == [RCController sharedInstance].currentPanel) {
        return;
    }
    self.currentSegueIdentifier = [RCController sharedInstance].currentPanel;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}
@end
