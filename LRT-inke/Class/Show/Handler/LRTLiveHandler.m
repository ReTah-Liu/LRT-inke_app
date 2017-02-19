//
//  LRTLiveHandler.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/18.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTLiveHandler.h"
#import "HttpTool.h"
#import "LRTLive.h"

@implementation LRTLiveHandler

+ (void) executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue])
        {
            failed(json);
        }
        else
        {
            //返回信息正确
            //数据解析
            NSArray *lives = [LRTLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);
        }
        
    } failure:^(NSError *error) {
        
        failed(error);
        
    }];
}

@end
