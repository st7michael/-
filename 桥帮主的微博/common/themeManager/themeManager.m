//
//  themeManager.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "themeManager.h"
#define defaultThemeName @"Cat"
#define DthemeName @"themeName"
@implementation themeManager

+ (themeManager*)shareInstance{
    
    static themeManager *instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [[[self class]alloc]init];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _themeName = defaultThemeName;
        NSString *saveThemeName = [[NSUserDefaults standardUserDefaults]objectForKey:DthemeName];
        if (saveThemeName.length >0) {
            _themeName = saveThemeName;
        }
        
        
        NSString *configurePath = [[NSBundle mainBundle]pathForResource:@"theme" ofType:@"plist"];
        _themeConfig = [NSDictionary dictionaryWithContentsOfFile:configurePath];
        
        NSString *themePath = [self themePath];
        NSString *filePath = [themePath stringByAppendingPathComponent:@"config.plist"];
        self.colorConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
    }
    return self;
}

- (void)setThemeName:(NSString *)themeName{
    if (![_themeName isEqualToString:themeName]) {
        _themeName = [themeName copy];
        
        [[NSUserDefaults standardUserDefaults]setObject:_themeName forKey:DthemeName];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        NSString *themePath = [self themePath];
        NSString *filePath = [themePath stringByAppendingPathComponent:@"config.plist"];
        _colorConfig = [NSDictionary dictionaryWithContentsOfFile:filePath];
        [[NSNotificationCenter defaultCenter] postNotificationName:themeDidChangeNotification object:nil];
    }
}

- (UIImage*)getThemeImage:(NSString*)imageName{
    if (imageName.length == 0) {
        return nil;
    }
    NSString *themePath = [self themePath];
    NSString *filePath = [themePath stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    return image;
}


- (NSString *)themePath{
    NSString *bundlePath = [[NSBundle mainBundle]resourcePath];
    NSString *themePath = [self.themeConfig objectForKey:_themeName];
    NSString *path = [bundlePath stringByAppendingPathComponent:themePath];
    return path;
}

- (UIColor*)getThemeColor:(NSString *)colorName{
    if (colorName.length == 0) {
        return nil;
    }
    NSDictionary *RGBDictionary = [self.colorConfig objectForKey:colorName];
    CGFloat R = [RGBDictionary[@"R"] floatValue];
    CGFloat G = [RGBDictionary[@"G"] floatValue];
    CGFloat B = [RGBDictionary[@"B"] floatValue];
    CGFloat alpha = [RGBDictionary[@"R"] floatValue];
    if (RGBDictionary[@"alpha"] == nil) {
        alpha = 1;
    }
    UIColor *color = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:alpha];
    return color;
    
}




@end
