
#import <UIKit/UIKit.h>

@interface GreyscalePanelViewController : UIViewController
@property(nonatomic,weak) IBOutlet UISegmentedControl* segment;
-(IBAction)changeSegment:(id)sender;
@end
