//
//  weiboModel.h
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/22.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "BaseModel.h"
#import "userModel.h"
@interface weiboModel : BaseModel
@property(nonatomic,copy)NSString       *createDate;       //微博创建时间
@property(nonatomic,retain)NSNumber     *weiboId;           //微博ID
@property(nonatomic,copy)NSString       *text;              //微博的内容
@property(nonatomic,copy)NSString       *source;              //微博来源
@property(nonatomic,retain)NSNumber     *favorited;         //是否已收藏
@property(nonatomic,copy)NSString       *thumbnailImage;     //缩略图片地址
@property(nonatomic,copy)NSString       *bmiddlelImage;     //中等尺寸图片地址
@property(nonatomic,copy)NSString       *originalImage;     //原始图片地址
@property(nonatomic,retain)NSDictionary *geo;               //地理信息字段
@property(nonatomic,retain)NSNumber     *repostsCount;      //转发数
@property(nonatomic,retain)NSNumber     *commentsCount;      //评论数

@property(nonatomic,retain)NSArray      *picGroup;//pictures album



@property(nonatomic,strong)userModel *userModel;
@property(nonatomic,strong)weiboModel *reWeiboModel;
@end
