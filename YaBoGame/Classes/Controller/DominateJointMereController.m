#import "DominateJointMereController.h"
#import "PurifyCommonSpiderView.h"
#import "SorryEnvelopeController.h"
#define kPrepareIdentifier @"prepare"
@interface DominateJointMereController ()
{
    BOOL _hasNewData;
    int _newNum;
    BOOL _hasNewCount;
    int _newCount;
}
@property (nonatomic, strong) PurifyCommonSpiderView *listView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger page;
@end
@implementation DominateJointMereController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundImageWihtImageName:@"select_bg"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newStageDidUnLock:) name:@"NewStageDidUnLock" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newCount:) name:@"NewCount" object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!self.listView) {
        __weak __typeof(self) weakSelf = self;
        self.listView = [[PurifyCommonSpiderView alloc] init];
        self.listView.didChangeScrollPage = ^(int page) {
            weakSelf.pageControl.currentPage = page;
            weakSelf.page = page;
        };
        self.listView.didSelectedStageView = ^(BattleUponSplendour *stage) {
            [weakSelf performSegueWithIdentifier:kPrepareIdentifier sender:stage];
        };
        [self.view insertSubview:self.listView atIndex:0];
        self.page = [[[NSUserDefaults standardUserDefaults] objectForKey:@"lastPage"] integerValue];
        [self.listView setContentOffset:CGPointMake(ScreenWidth * self.page, 0) animated:NO];
    }
    if (_hasNewData) {
        if ((_newNum - 1) / 6 == self.page) {
            [self.listView contributeUnderneathThisPink:_newNum];
            _hasNewData = NO;
        }
    }
    if (_hasNewCount) {
        [self.listView contributeUnderneathThisPink:_newCount - 1];
        _hasNewCount = NO;
    }
}
- (void)setPage:(NSInteger)page {
    if (_hasNewData) {
        if (_page == page - 1 && _hasNewData) {
            [self.listView contributeUnderneathThisPink:_newNum];
            _hasNewData = NO;
        }
    }
    _page = page;
    [[NSUserDefaults standardUserDefaults] setObject:@(page) forKey:@"lastPage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kPrepareIdentifier]) {
        SorryEnvelopeController *prepaerVC = segue.destinationViewController;
        prepaerVC.stage = (BattleUponSplendour *)sender;
    }
}
- (void)newCount:(NSNotification *)noti {
    _hasNewCount = YES;
    _newCount = [noti.object intValue];
}
- (void)newStageDidUnLock:(NSNotification *)noti {
    _hasNewData = YES;
    _newNum = [noti.object intValue];
}
@end

