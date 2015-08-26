//
//  moreTableViewCell.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "themeManager.h"
#import "themeLabel.h"
#import "themeImageView.h"
@interface moreTableViewCell : UITableViewCell

@property (nonatomic,strong)themeLabel *themeTextLabel;
@property (nonatomic,strong)themeLabel *themeDetailLabel;
@property (nonatomic,strong)themeImageView *themeImageView;


@end
