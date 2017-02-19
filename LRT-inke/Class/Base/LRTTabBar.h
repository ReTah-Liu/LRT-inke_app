//
//  LRTTabBar.h
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/17.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LRTItemType) {
    
    LRTItemTypeLaunch = 10, //直播
    LRTItemTypeLive = 100, //主页
    LRTItemTypeMe, //我的
    
};

@class LRTTabBar;

typedef void(^TabBlock)(LRTTabBar *tabbar, LRTItemType idx);

@protocol LRTTabBarDelegate <NSObject>

- (void)tabbar:(LRTTabBar *)tabbar clickButton:(LRTItemType)idx;

@end

@interface LRTTabBar : UIView

@property (nonatomic, weak) id<LRTTabBarDelegate> delegate;

@property (nonatomic, copy) TabBlock block;

@end
