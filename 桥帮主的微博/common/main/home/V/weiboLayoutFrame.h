//
//  weiboLayoutFrame.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/24.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//


//set weibo cell in different conditions
#import <Foundation/Foundation.h>
#import "weiboModel.h"
@interface weiboLayoutFrame : NSObject

@property (nonatomic,strong)weiboModel *weiboModel;
@property (nonatomic,assign)CGRect textFrame;
@property (nonatomic,assign)CGRect backFrame;
@property (nonatomic,assign)CGRect sourceFrame;
@property (nonatomic,assign)CGRect imgFrame;
@property (nonatomic,assign)CGRect frame;

@end
