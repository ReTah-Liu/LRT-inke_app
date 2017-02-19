//
//  LRTMainViewController.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/17.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTMainViewController.h"
#import "LRTMainTopView.h"

@interface LRTMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic, strong) NSArray *datalist;

@property (nonatomic, strong) LRTMainTopView *topView;

@end

@implementation LRTMainViewController

- (LRTMainTopView *)topView
{
    if (!_topView) {
        
        _topView = [[LRTMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.datalist];
        
        //YYKitMacro.h
        @weakify(self);
        
        _topView.block = ^(NSInteger tag) {
            
            @strongify(self);
            
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH, self.contentScrollView.contentOffset.y);
            [self.contentScrollView setContentOffset:point animated:YES];
        };
    }
    return _topView;
}

- (NSArray *)datalist
{
    if (!_datalist) {
        _datalist = @[@"关注",@"热门",@"附近",@"短视频",@"才艺",@"好声音"];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
}

- (void)initUI {
    
    //添加左右按钮
    [self setupNav];
    
    //添加子视图控制器
    [self setupChildViewControllers];
    
}

- (void) setupChildViewControllers {
    NSArray *vcNames = @[@"LRTFocusViewController",@"LRTHotViewController",@"LRTNearViewController",@"LRTShortVideoViewController",@"LRTTalentViewController",@"LRTGoodVoiceViewController"];
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.datalist[i];
        
        //self.automaticallyAdjustsScrollViewInsets = NO;
        
        //当执行addChildViewController时，不会执行vc的viewDidLoad
        [self addChildViewController:vc];
    }
    
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.datalist.count, 0);
    
    //关闭弹动
    self.contentScrollView.bounces = NO;
    
    //默认先显示第二个界面
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

- (void) setupNav {
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

//动画结束调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    
    CGFloat offset = scrollView.contentOffset.x ;
    
    //获取子控制器的索引
    NSInteger idx = offset / width;
    
    //视图联动topView
    [self.topView scrolling:idx];
    
    //根据索引返回vc引用
    UIViewController *vc = self.childViewControllers[idx];
    
    //判断当前vc是否执行过viewDidLoad
    if ([vc isViewLoaded]) {
        return;
    }
    
    //设置子控制器的view大小
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);
    
    [scrollView addSubview:vc.view];
}

//减速结束加载子控制器
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
