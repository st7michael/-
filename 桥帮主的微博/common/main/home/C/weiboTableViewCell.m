//
//  weiboTableViewCell.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/22.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "weiboTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "weiboCellView.h"
#import "Utils.h"


@implementation weiboTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self  = [super initWithStyle:style reuseIdentifier: reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    _weiboCellView = [[weiboCellView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_weiboCellView];
    self.backgroundColor = [UIColor clearColor];
    
    _userName.themeLabelColor = @"Timeline_Name_color";
}

- (void)setLayoutFrame:(weiboLayoutFrame *)layoutFrame{
    if (_layoutFrame != layoutFrame) {
        _layoutFrame = layoutFrame;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    weiboModel *weiboModel = self.layoutFrame.weiboModel;
    //
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:weiboModel.userModel.profile_image_url]];
    //user name
    _userName.text = weiboModel.userModel.name;
    //time
    _time.text = [Utils weiboDateString:weiboModel.createDate];
    //
    _from.text = [NSString stringWithFormat:@"%@",weiboModel.source];
    //
    _commits.text = [NSString stringWithFormat:@"评论:%@",weiboModel.commentsCount];
    //
    _repost.text = [NSString stringWithFormat:@"转发:%@",weiboModel.repostsCount];
    
    _weiboCellView.layoutFrame = _layoutFrame;
    _weiboCellView.frame = _layoutFrame.frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
