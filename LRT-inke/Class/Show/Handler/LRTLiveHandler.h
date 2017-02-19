//
//  LRTLiveHandler.h
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/18.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTBaseHandler.h"

@interface LRTLiveHandler : LRTBaseHandler

//获取热门直播信息
+ (void) executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

@end
