
#import "GreyscalePanelViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "RCToolkit.h"
#import "UIImage+OpenCV.h"

@interface GreyscalePanelViewController ()

@end

@implementation GreyscalePanelViewController

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
    NSLog(@"Greyscale");
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillDisappear:(BOOL)animated{
    NSLog(@"Greyscale will dissapear");
    _segment.selectedSegmentIndex = 0;
}
-(IBAction)changeSegment:(id)sender{
    switch (_segment.selectedSegmentIndex) {
        case 0:
            self.sideMenuViewController.backgroundImage = [RCController sharedInstance].currentImage;
            break;
        case 1:
            self.sideMenuViewController.backgroundImage = [[RCController sharedInstance].currentImage greyedImage];
            break;
    }
}
@end
