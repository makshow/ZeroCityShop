#import "ExtendDateOrganicController.h"
@interface ExtendDateOrganicController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMargin;
@property (weak, nonatomic) IBOutlet UIButton *bgMusicButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UIButton *other1Button;
@property (weak, nonatomic) IBOutlet UIButton *other2Button;
@property (weak, nonatomic) IBOutlet UIButton *other3Button;
@end
@implementation ExtendDateOrganicController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundImageWihtImageName:@"setting_bg"];
    [self startSetTopMargin];
    [self setButtonsTitle];
}
- (void)setButtonsTitle {
    [self.bgMusicButton setTitle:[NSString stringWithFormat:@"MUSIC %@", [self buttonTitleWihtSoundPlayType:[[YaBoOrgyTool sharedSoundToolManager] bgMusicType]]] forState:UIControlStateNormal];
    [self.soundButton setTitle:[NSString stringWithFormat:@"SOUND %@", [self buttonTitleWihtSoundPlayType:[[YaBoOrgyTool sharedSoundToolManager] soundType]]] forState:UIControlStateNormal];
}
- (void)startSetTopMargin {
    if (iPhone5) {
        self.topMargin.constant = 120;
    } else {
        self.topMargin.constant = 120 - ScreenHeightDifference - 10;
    }
    [self.view setNeedsLayout];
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (sender.tag == 10) {
        NSString *subTitle = [self nextButtonTitleWihtSoundPlayType:[[YaBoOrgyTool sharedSoundToolManager] bgMusicType]];
        [sender setTitle:[NSString stringWithFormat:@"MUSIC %@", subTitle] forState:UIControlStateNormal];
        [[YaBoOrgyTool sharedSoundToolManager] setBgMusicType:[self typeWihtSoundPlayType:[[YaBoOrgyTool sharedSoundToolManager] bgMusicType]]];
    } else if (sender.tag == 11) {
        NSString *subTitle = [self nextButtonTitleWihtSoundPlayType:[[YaBoOrgyTool sharedSoundToolManager] soundType]];
        [sender setTitle:[NSString stringWithFormat:@"SOUND %@", subTitle] forState:UIControlStateNormal];
        [[YaBoOrgyTool sharedSoundToolManager] setSoundType:[self typeWihtSoundPlayType:[[YaBoOrgyTool sharedSoundToolManager] soundType]]];
    }
    [[YaBoOrgyTool sharedSoundToolManager] patWorthyLiberty:YaSoundCliclName];
}
- (NSString *)nextButtonTitleWihtSoundPlayType:(SoundPlayType)type {
    if (type == 0) {
        return @"[MED]";
    } else if (type == 1) {
        return @"[LOW]";
    } else if (type == 2) {
        return @"[OFF]";
    } else {
        return @"[HIGH]";
    }
}
- (NSString *)buttonTitleWihtSoundPlayType:(SoundPlayType)type {
    if (type == 0) {
        return @"[HIGH]";
    } else if (type == 1) {
        return @"[MED]";
    } else if (type == 2) {
        return @"[LOW]";
    } else {
        return @"[OFF]";
    }
}
- (SoundPlayType)typeWihtSoundPlayType:(SoundPlayType)type {
    if (type == SoundPlayTypeHight) {
        return SoundPlayTypeMiddle;
    } else if (type == SoundPlayTypeMiddle) {
        return SoundPlayTypeLow;
    } else if (type == SoundPlayTypeLow) {
        return SoundPlayTypeMute;
    } else {
        return SoundPlayTypeHight;
    }
}
@end


