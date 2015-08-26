//
//  AppDelegate.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/19.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,SinaWeiboDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) SinaWeibo *sinaweibo;


@end

