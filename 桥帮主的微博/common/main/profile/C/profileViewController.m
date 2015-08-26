//
//  profileViewController.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/19.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "profileViewController.h"
#import "moreTableViewController.h"
#import "moreTableViewCell.h"
#import "themeManager.h"
@interface profileViewController (){
    UITableView *table;
    
}

@end

@implementation profileViewController

- (void)_createTableView{
    table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    [table registerClass:[moreTableViewCell class] forCellReuseIdentifier:@"more"];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    moreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"more" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.themeImageView.imageName = @"more_icon_theme.png";
            cell.themeTextLabel.text = @"主题选择";
            cell.themeDetailLabel.text = [themeManager shareInstance].themeName;
        }
        else if(indexPath.row == 1) {
            cell.themeImageView.imageName = @"more_icon_account.png";
            cell.themeTextLabel.text = @"账户管理";
        }
    }
    else if(indexPath.section == 1) {
        cell.themeTextLabel.text = @"意见反馈";
        cell.themeImageView.imageName = @"more_icon_feedback.png";
    }
    else if(indexPath.section == 2) {
        cell.themeTextLabel.text = @"登出当前账号";
        cell.themeTextLabel.textAlignment = NSTextAlignmentCenter;
        cell.themeTextLabel.center = cell.contentView.center;
    }
    
    if (indexPath.section != 2) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0 && indexPath.section == 0){
        moreTableViewController *moreVc = [[moreTableViewController alloc]init];
        [self.navigationController pushViewController:moreVc animated:YES];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTableView];
    
    self.title = @"profile";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
