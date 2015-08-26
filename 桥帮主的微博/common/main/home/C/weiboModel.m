//
//  weiboModel.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/22.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "weiboModel.h"
#import "RegexKitLite.h"
@implementation weiboModel
- (NSDictionary*)attributeMapDictionary{
    //   @"属性名": @"数据字典的key"
    NSDictionary *mapAtt = @{
                             @"createDate":@"created_at",
                             @"weiboId":@"id",
                             @"text":@"text",
                             @"source":@"source",
                             @"favorited":@"favorited",
                             @"thumbnailImage":@"thumbnail_pic",
                             @"bmiddlelImage":@"bmiddle_pic",
                             @"originalImage":@"original_pic",
                             @"geo":@"geo",
                             @"repostsCount":@"reposts_count",
                             @"commentsCount":@"comments_count",
                             @"picGroup":@"pic_ids",
                             };
    return mapAtt;
}

- (void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    if (_source!=nil) {
        NSString *regex = @">.+<";
        NSArray *items = [_source componentsMatchedByRegex:regex];
        if (items.count!=0) {
            NSString *temp = items[0];
            temp = [temp substringWithRange:NSMakeRange(1, temp.length-2)];
            _source = [NSString stringWithFormat:@"来自:%@",temp];
        }
    }
    //emotions
    NSString *regex = @"\\[\\w+\\]";
    NSArray *faceItems = [_text componentsMatchedByRegex:regex];
    
    NSString *configurePath = [[NSBundle mainBundle]pathForResource:@"emoticons" ofType:@"plist"];
    NSArray *faceConfiArray = [NSArray arrayWithContentsOfFile:configurePath];
    
    for (NSString *faceName in faceItems) {
        NSString *t = [NSString stringWithFormat:@"self.chs='%@'",faceName];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:t];
        NSArray *items = [faceConfiArray filteredArrayUsingPredicate:predicate];
        
        if (items.count > 0) {
            NSDictionary *faceDic = items[0];
            NSString *imageName = [faceDic objectForKey:@"png"];
            NSString *replaceString = [NSString stringWithFormat:@"<image url = '%@'>",imageName];
            self.text = [self.text stringByReplacingOccurrencesOfString:faceName withString:replaceString];
        }
    }
    

    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    if (userDic!=nil) {
        userModel *usermodel = [[userModel alloc]initWithDataDic:userDic];
        self.userModel = usermodel;
    }
    NSDictionary *reDic = [dataDic objectForKey:@"retweeted_status"];
    if (reDic!= nil) {
        self.reWeiboModel = [[weiboModel alloc]initWithDataDic:reDic];
    }
}


@end
