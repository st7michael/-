//
//  themeManager.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface themeManager : NSObject

@property (nonatomic,copy)NSString *themeName;
@property (nonatomic,strong)NSDictionary *themeConfig;
@property (nonatomic,strong)NSDictionary *colorConfig;


+ (themeManager*)shareInstance;

- (UIImage *)getThemeImage:(NSString*)imageName;
- (UIColor*)getThemeColor:(NSString *)colorName;
@end
