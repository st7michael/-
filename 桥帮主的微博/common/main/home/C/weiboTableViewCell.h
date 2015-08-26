//
//  weiboTableViewCell.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/22.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weiboModel.h"
#import "weiboLayoutFrame.h"
#import "weiboCellView.h"
#import "themeLabel.h"
@interface weiboTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet themeLabel *repost;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet themeLabel *userName;
@property (weak, nonatomic) IBOutlet themeLabel *time;
@property (weak, nonatomic) IBOutlet themeLabel *commits;
@property (weak, nonatomic) IBOutlet themeLabel *from;

@property (nonatomic,strong)weiboLayoutFrame *layoutFrame;
@property (nonatomic,strong)weiboCellView *weiboCellView;

@end
