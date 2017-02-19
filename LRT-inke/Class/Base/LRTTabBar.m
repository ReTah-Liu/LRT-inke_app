//
//  LRTTabBar.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/17.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTTabBar.h"

@interface LRTTabBar ()

@property (nonatomic, strong) UIImageView *tabbgView;

@property (nonatomic, strong) NSArray *datalist;

@property (nonatomic, strong) UIButton *lastItem;

@property (nonatomic, strong) UIButton *cameraButton;

@end

@implementation LRTTabBar

- (UIButton *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraButton sizeToFit];
        _cameraButton.tag = LRTItemTypeLaunch;
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

- (NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"tab_live",@"tab_me"];
    }
    return  _datalist;
}

- (UIImageView *)tabbgView {
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //加载背景
        [self addSubview:self.tabbgView];
        for (NSInteger i = 0; i < self.datalist.count; i++) {
            
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = LRTItemTypeLive + i;
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            
            [self addSubview:item];
            
        }
        
        [self addSubview:self.cameraButton];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds;
    CGFloat width = self.bounds.size.width / self.datalist.count;
    
    for (NSInteger i = 0; i < [self subviews].count; i++) {
        UIView *btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - LRTItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
    [_cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 50);
}

- (void) clickItem:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:button.tag];
    }
    
    !self.block?:self.block(self,button.tag);
    
    if (button.tag == LRTItemTypeLaunch) {
        return;
    }
    
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    //点击动画
    [UIView animateWithDuration:0.2 animations:^{
        //放大1.2倍
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            //恢复原始大小
            button.transform = CGAffineTransformIdentity;
        }];
    }];
    
}

@end
