//
//  weiboCellView.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/24.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "weiboCellView.h"
#import "weiboView.h"
#import "weiboModel.h"
#import "UIImageView+WebCache.h"
#import "weiboLayoutFrame.h"
@implementation weiboCellView{
  //  UIButton *imageButton;
}

//- (void)dealloc{
//    //
//    [[NSNotificationCenter defaultCenter]removeObserver:themeDidChangeNotification];
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor redColor];
        [self _createSubviews];
    }
    return self;
}

- (void)_createSubviews{
    //text
    _textLabel = [[WXLabel alloc]initWithFrame:CGRectZero];
    _textLabel.linespace = 5;
    _textLabel.wxLabelDelegate = self;
    _textLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_textLabel];
    
    //source
    _sourceLabel = [[WXLabel alloc]initWithFrame:CGRectZero];
    _sourceLabel.linespace = 5;
    _sourceLabel.wxLabelDelegate = self;
    _sourceLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview: _sourceLabel];
    
    //weibo image
    _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:_imageView];
    
    _themeImageView = [[themeImageView alloc]initWithFrame:CGRectZero];
    _themeImageView.leftCapWidth = 25;
    _themeImageView.topCapWidth = 25;
    _themeImageView.imageName = @"timeline_rt_border_9.png";
    [self insertSubview:_themeImageView atIndex:0];
}

- (void)setLayoutFrame:(weiboLayoutFrame *)layoutFrame{
    if (_layoutFrame !=layoutFrame) {
        _layoutFrame = layoutFrame;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    weiboModel *weiboModel = _layoutFrame.weiboModel;
    _textLabel.frame = self.layoutFrame.textFrame;
    _textLabel.text = weiboModel.text;
    if (weiboModel.reWeiboModel != nil) {
        self.themeImageView.hidden = NO;
        self.sourceLabel.hidden = NO;
        //original weibo background
        self.themeImageView.frame = self.layoutFrame.backFrame;
        //original text & background
       
        NSString *originalName = weiboModel.reWeiboModel.userModel.name;
        NSString *t = [@"@" stringByAppendingString:originalName];
        NSString *str = [t stringByAppendingString:@": "];
        _sourceLabel.text = [str stringByAppendingString:weiboModel.reWeiboModel.text];
        //self.sourceLabel.text = weiboModel.reWeiboModel.text;
        self.sourceLabel.frame = self.layoutFrame.sourceFrame;
        NSString *imgUrl = weiboModel.reWeiboModel.thumbnailImage;
        if (imgUrl != nil) {
            self.imageView.hidden = NO;
            self.imageView.frame = self.layoutFrame.imgFrame;
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
        }
        else{
            _imageView.hidden = YES;
        }
    }
    else{
        _themeImageView.hidden = YES;
        _sourceLabel.hidden = YES;
        NSString *imgUrl = weiboModel.thumbnailImage;
        if (imgUrl == nil) {
            _themeImageView.hidden = YES;
        }
        else{
            self.imageView.hidden = NO;
            self.imageView.frame = self.layoutFrame.imgFrame;
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
        }
    }
}

//手指离开当前超链接文本响应的协议方法
- (void)toucheEndWXLabel:(WXLabel *)wxLabel withContext:(NSString *)context{

}
//手指接触当前超链接文本响应的协议方法
- (void)toucheBenginWXLabel:(WXLabel *)wxLabel withContext:(NSString *)context{
    NSLog(@"%@",context);
    NSURL *url = [NSURL URLWithString:context];
    [[UIApplication sharedApplication]openURL:url];
    
}


- (NSString *)contentsOfRegexStringWithWXLabel:(WXLabel *)wxLabel{
 //需要添加链接字符串的正则表达式：@用户、http://、#话题#
 NSString *regex1 = @"@\\w+";
 NSString *regex2 = @"http(s)?://([A-Za-z0-9._-]+(/)?)*";
 NSString *regex3 = @"#\\w+#";
 NSString *regex = [NSString stringWithFormat:@"(%@)|(%@)|(%@)",regex1,regex2,regex3];
 return regex;
}
//
////检索文本的正则表达式的字符串
//- (NSString *)contentsOfRegexStringWithWXLabel:(WXLabel *)wxLabel{
//    
//}
//设置当前链接文本的颜色
- (UIColor *)linkColorWithWXLabel:(WXLabel *)wxLabel{
    return [UIColor redColor];
}

- (UIColor *)passColorWithWXLabel:(WXLabel *)wxLabel{
    return [UIColor blueColor];
}
//设置当前文本手指经过的颜色



@end
