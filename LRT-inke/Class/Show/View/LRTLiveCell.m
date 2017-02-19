//
//  LRTLiveCell.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/18.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTLiveCell.h"

@interface LRTLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation LRTLiveCell

- (void)setLive:(LRTLive *)live
{
    _live = live;
    
    [self.headView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"default_room"];
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onLineLabel.text = [@(live.onlineUsers) stringValue];
    [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"default_room"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //将头像变成圆的显示
    self.headView.layer.cornerRadius = 25;
    self.headView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
