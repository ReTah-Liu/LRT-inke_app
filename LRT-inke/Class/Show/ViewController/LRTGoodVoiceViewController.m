//
//  LRTGoodVoiceViewController.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/18.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTGoodVoiceViewController.h"

@interface LRTGoodVoiceViewController ()

@end

@implementation LRTGoodVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 200, 100, 50)];
    titleLabel.text = @"好声音";
    [self.view addSubview:titleLabel];
    
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
