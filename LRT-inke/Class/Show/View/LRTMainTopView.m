//
//  LRTMainTopView.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/17.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTMainTopView.h"

@interface LRTMainTopView ()

@property (nonatomic, strong) IBOutlet UIScrollView *topScrollView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation LRTMainTopView

- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return  _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    
    CGFloat topScrollViewWidth = self.width + 60;
    CGFloat topScrollViewHeight = self.height;
    
    CGFloat btnWidth = self.width / titles.count;
    CGFloat btnHeight = self.height;
    
    self.topScrollView = [[UIScrollView alloc] init];
    self.topScrollView.frame = CGRectMake(0 - 30, 0, topScrollViewWidth, topScrollViewHeight);
    //整页滚动
    self.topScrollView.pagingEnabled = YES;
    //隐藏滚动条
    self.topScrollView.showsHorizontalScrollIndicator = NO;
    //禁止弹动
    self.topScrollView.bounces = NO;
    self.topScrollView.contentSize = CGSizeMake((btnWidth + 30) * titles.count, 0);
    //self.topScrollView.contentOffset = CGPointMake(0, 0);
    
    [self addSubview:_topScrollView];
    
    if (self) {
        
        for (NSInteger i = 0; i < titles.count; i++) {
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [self.buttons addObject:titleBtn];
            
            NSString *vcName = titles[i];
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            titleBtn.tag = i;
            
            titleBtn.frame = CGRectMake(i * (btnWidth + 30), 0, btnWidth + 30, btnHeight);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.topScrollView addSubview:titleBtn];
            
            if (i == 1) {
                
                CGFloat h = 2;
                CGFloat y = 40;
                
                //[titleBtn.titleLabel sizeToFit];
                
                self.lineView = [[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.height = h;
                self.lineView.width = 30;
                self.lineView.top = y;
                self.lineView.centerX = titleBtn.centerX;
                
                [self.topScrollView addSubview:self.lineView];
                
            }
        }
    }
    return self;
}

//scrollView滚动时调用
- (void) scrolling:(NSInteger)tag
{
    UIButton *button = self.buttons[tag];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX= button.centerX;
    }];
}

//topView点击事件
- (void)titleClick:(UIButton *)button
{
    if (button.tag <= 2) {
        self.topScrollView.contentOffset = CGPointMake(0, 0);
    }
    else
    {
        self.topScrollView.contentOffset = CGPointMake(150, 0);
    }
    
    self.block(button.tag);
    
    [self scrolling:button.tag];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
