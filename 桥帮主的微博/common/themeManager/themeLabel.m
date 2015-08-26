//
//  themeLabel.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "themeLabel.h"
#import "themeManager.h"
@implementation themeLabel

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:themeDidChangeNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_loadColor) name:themeDidChangeNotification object:nil];
    }
    return self;
}

- (void)awakeFromNib{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_loadColor) name:themeDidChangeNotification object:nil];
}

- (void)_loadColor{
    UIColor *labelColor = [[themeManager shareInstance]getThemeColor:_themeLabelColor];
    self.textColor = labelColor;
}

- (void)setThemeLabelColor:(NSString *)themeLabelColor{
    if (![_themeLabelColor isEqualToString:themeLabelColor]) {
        _themeLabelColor = themeLabelColor;
    }
    [self _loadColor];
}

@end
