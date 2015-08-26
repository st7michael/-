//
//  weiboView.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/23.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weiboView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *layoutFrameArray;
@end
