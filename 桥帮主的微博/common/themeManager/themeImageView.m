//
//  themeImageView.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "themeImageView.h"
#import "themeManager.h"
@implementation themeImageView

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:themeDidChangeNotification object:nil];
}
- (void)awakeFromNib{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChangeAction:) name:themeDidChangeNotification object:nil];
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeDidChangeAction:) name:themeDidChangeNotification object:nil];
    }
    return self;
}

- (void)themeDidChangeAction:(NSNotification *)notification{
    [self _loadImage];
}


- (void)setImageName:(NSString *)imageName{
    if (![_imageName isEqualToString:imageName]) {
        _imageName = [imageName copy];
        [self _loadImage];
    }
}

- (void)_loadImage{
    themeManager *manager = [themeManager shareInstance];
    UIImage *image = [manager getThemeImage:_imageName];
  //  [self setImage:normalImage forState:UIControlStateNormal];
    image = [image stretchableImageWithLeftCapWidth:_leftCapWidth topCapHeight:_topCapWidth];
    
    self.image = image;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
