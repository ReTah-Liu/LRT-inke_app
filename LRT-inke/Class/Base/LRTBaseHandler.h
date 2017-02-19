//
//  LRTBaseHandler.h
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/18.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

//处理完成事件
typedef void(^CompleteBlock)();

//处理事件成功
typedef void(^SuccessBlock)(id obj);

//处理事件失败
typedef void(^FailedBlock)(id obj);

@interface LRTBaseHandler : NSObject

@end
