//
//  themeButton.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "themeButton.h"
#import "themeManager.h"
@implementation themeButton

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:themeDidChangeNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeDidChangeAction:) name:themeDidChangeNotification object:nil];
    }
    return self;
}
- (void)awakeFromNib{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChangeAction:) name:themeDidChangeNotification object:nil];
}

- (void)themeDidChangeAction:(NSNotification *)notification{
    [self _loadImage];
}

- (void)setNormalImageName:(NSString *)normalImageName{
    if (![_normalImageName isEqualToString:normalImageName]) {
        _normalImageName = [normalImageName copy];
    }
    [self _loadImage];
}

- (void)setNormalBackName:(NSString *)normalBackName{
    if (![_normalBackName isEqualToString:normalBackName]) {
        _normalBackName = [normalBackName copy];
    }
     [self _loadImage];
}
- (void)setHighBackName:(NSString *)highBackName{
    if (![_highBackName isEqualToString:highBackName]) {
        _highBackName = [highBackName copy];
    }
    
    [self _loadImage];
}
- (void)setHighLightName:(NSString *)highLightName{
    if (![_highLightName isEqualToString:highLightName]) {
        _highLightName = [highLightName copy];
    }
     [self _loadImage];
}

- (void)_loadImage{
    themeManager *manager = [themeManager shareInstance];
    UIImage *normalImage = [manager getThemeImage:_normalImageName];
    [self setImage:normalImage forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
