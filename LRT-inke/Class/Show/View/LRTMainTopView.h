//
//  LRTMainTopView.h
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/17.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface LRTMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

@property (nonatomic, copy) MainTopBlock block;

- (void) scrolling:(NSInteger)tag;

@end
