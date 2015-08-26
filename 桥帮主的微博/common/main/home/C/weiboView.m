//
//  weiboView.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/23.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "weiboView.h"
#import "weiboModel.h"
#import "weiboTableViewCell.h"

@implementation weiboView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self createView];
    }
    return self;
}


- (void)createView{
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor clearColor];
    UINib *nib = [UINib nibWithNibName:@"weiboTableViewCell" bundle:[NSBundle mainBundle]];
    [self registerNib:nib forCellReuseIdentifier:@"cell"];
}

- (void)awakeFromNib{
    [self createView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _layoutFrameArray.count;
}

- (NSInteger)numberOfSections{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    weiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.layoutFrame = _layoutFrameArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    weiboLayoutFrame *weiboLayoutFrame = _layoutFrameArray[indexPath.row];
    CGRect frame = weiboLayoutFrame.frame;
    CGFloat height = frame.size.height;
    return height+85;
}

@end
