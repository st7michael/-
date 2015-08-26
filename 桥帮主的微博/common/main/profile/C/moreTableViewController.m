//
//  moreTableViewController.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/21.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "moreTableViewController.h"
#import "moreTableViewCell.h"
#import "themeManager.h"
@interface moreTableViewController (){
    NSArray *themeNameArray;
}

@end

@implementation moreTableViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return  self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"theme.plist" ofType:nil];
    
    NSDictionary *themeConfig = [NSDictionary dictionaryWithContentsOfFile:path];
    
    themeNameArray = [themeConfig allKeys];
    
    [self.tableView registerClass:[moreTableViewCell class] forCellReuseIdentifier:@"more"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  themeNameArray.count;

}
#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    moreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"more" forIndexPath:indexPath];
    cell.themeTextLabel.text = themeNameArray[indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *themeName = themeNameArray[indexPath.row];
    [[themeManager shareInstance] setThemeName:themeName];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


@end
