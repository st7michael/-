//
//  weiboCellView.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/24.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weiboModel.h"
#import "themeImageView.h"
#import "WXLabel.h"
//#import "weiboLayoutFrame.h"
@class weiboLayoutFrame;

@interface weiboCellView : UIView<WXLabelDelegate>
//@property (nonatomic,strong)WXLabel *sourceView;
@property (nonatomic,strong)WXLabel *textLabel;
@property (nonatomic,strong)WXLabel *sourceLabel;

@property (nonatomic,strong)themeImageView *themeImageView;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)weiboLayoutFrame *layoutFrame;

@end
