//
//  LRTTabBarViewController.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/17.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTTabBarViewController.h"
#import "LRTTabBar.h"
#import "LRTBaseNavViewController.h"
#import "LRTLaunchViewController.h"

@interface LRTTabBarViewController ()<LRTTabBarDelegate>

@property (nonatomic, strong) LRTTabBar *lrtTabbar;

@end

@implementation LRTTabBarViewController

-(LRTTabBar *)lrtTabbar {
    if (!_lrtTabbar) {
        _lrtTabbar = [[LRTTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _lrtTabbar.delegate = self;
    }
    return  _lrtTabbar;
}

-(void)tabbar:(LRTTabBar *)tabbar clickButton:(LRTItemType)idx {
    
    if (idx != LRTItemTypeLaunch) {
        self.selectedIndex = idx - LRTItemTypeLive;
        return;
    }
    
    LRTLaunchViewController *launchVC = [[LRTLaunchViewController alloc] init];
    [self presentViewController:launchVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载控制器
    [self configViewControllers];
    
    //加载tabbar
    [self.tabBar addSubview:self.lrtTabbar];
    //去除TabBar阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
}

- (void) configViewControllers {
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"LRTMainViewController",@"LRTMeViewController"]];
    
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        LRTBaseNavViewController *nav = [[LRTBaseNavViewController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
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
