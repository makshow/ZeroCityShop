#import "PolluteStomachFurtherView.h"
@interface PolluteStomachFurtherView ()
@property (weak, nonatomic) IBOutlet UIImageView *upIV;
@property (weak, nonatomic) IBOutlet UIImageView *downIV;
@end
@implementation PolluteStomachFurtherView
- (void)stumbleInLiterature:(NSInteger)index {
    if (index == 1) {
        [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundManDownName];
        self.upIV.hidden = YES;
        self.downIV.hidden = NO;
    } else {
        [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundManUpName];
        self.upIV.hidden = NO;
        self.downIV.hidden = YES;
    }
}
- (void)tactileCivilization {
    self.upIV.hidden = NO;
    self.downIV.hidden = YES;
}
@end

