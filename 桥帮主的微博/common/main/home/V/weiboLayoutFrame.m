//
//  weiboLayoutFrame.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/24.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "weiboLayoutFrame.h"
#import "WXLabel.h"
@implementation weiboLayoutFrame

- (void)setWeiboModel:(weiboModel *)weiboModel{
    if (_weiboModel != weiboModel) {
        _weiboModel = weiboModel;
        //重新计算
        [self _layoutFrame];
    }
}
- (void)_layoutFrame{
        //根据 weiboModel计算
        //1.微博视图的frame
        self.frame = CGRectMake(55, 40, w-65, 0);
        //2.微博内容的frame
    
        //1>计算微博内容的宽度
        CGFloat textWidth = CGRectGetWidth(self.frame)-20;
        
        //2>计算微博内容的高度
        NSString *text = self.weiboModel.text;
        CGFloat textHeight = [WXLabel getTextHeight:15 width:textWidth text:text linespace:5.0];
    
        self.textFrame = CGRectMake(10, 0, textWidth, textHeight);
        
        //3.原微博的内容frame
        if (self.weiboModel.reWeiboModel != nil) {
            NSString *reText = self.weiboModel.reWeiboModel.text;

            //1>宽度
            CGFloat reTextWidth = textWidth-20;
            //2>高度
            CGFloat textHeight = [WXLabel getTextHeight:14 width:reTextWidth text:reText linespace:5.0];
            //3>Y坐标
            CGFloat Y = CGRectGetMaxY(self.textFrame)+10;
            self.sourceFrame = CGRectMake(20, Y, reTextWidth, textHeight);
            //4.原微博的图片
            NSString *thumbnailImage = self.weiboModel.reWeiboModel.thumbnailImage;
            if (thumbnailImage != nil) {
                CGFloat Y = CGRectGetMaxY(_sourceFrame)+10;
                CGFloat X = CGRectGetMinX(_sourceFrame);
                self.imgFrame = CGRectMake(X, Y, 80, 80);
            }
            //4.原微博的背景
            CGFloat bgX = CGRectGetMinX(self.textFrame);
            CGFloat bgY = CGRectGetMaxY(self.textFrame);
            CGFloat bgWidth = CGRectGetWidth(self.textFrame);
            CGFloat bgHeight = CGRectGetMaxY(_sourceFrame);
            if (thumbnailImage != nil) {
                bgHeight = CGRectGetMaxY(self.imgFrame);
            }
            bgHeight -= CGRectGetMaxY(self.textFrame);
            bgHeight += 10;
            
            _backFrame = CGRectMake(bgX, bgY, bgWidth, bgHeight);
            
        } else {
            //微博图片
            NSString *thumbnailImage = self.weiboModel.thumbnailImage;
            if (thumbnailImage != nil) {
                CGFloat imgX = CGRectGetMinX(self.textFrame);
                CGFloat imgY = CGRectGetMaxY(self.textFrame)+10;
                self.imgFrame = CGRectMake(imgX, imgY, 80, 80);
            }
        }
        //计算微博视图的高度：微博视图最底部子视图的Y坐标
        CGRect f = self.frame;
        if (self.weiboModel.reWeiboModel != nil) {
            f.size.height = CGRectGetMaxY(_backFrame);
        }
        else if(self.weiboModel.thumbnailImage != nil) {
            f.size.height = CGRectGetMaxY(_imgFrame);
        }
        else {
            f.size.height = CGRectGetMaxY(_textFrame);
        }
        self.frame = f;
}

@end
