//
//  MJExtensionConfig.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/18.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "LRTCreator.h"
#import "LRTLive.h"

@implementation MJExtensionConfig

+ (void)load {
    
    //下滑线
    [LRTLive mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [LRTCreator mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
