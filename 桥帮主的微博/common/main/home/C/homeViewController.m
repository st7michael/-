//
//  homeViewController.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/19.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "homeViewController.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"
#import "weiboView.h"
#import "BaseModel.h"
#import "weiboModel.h"
#import "weiboLayoutFrame.h"
#import "MJRefresh.h"
@interface homeViewController ()

@end

@implementation homeViewController{
    weiboView *_weiboTable;
}

- (void)addWeiboTable{
    _weiboTable = [[weiboView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview: _weiboTable];

    UIRefreshControl *refresh = [[UIRefreshControl alloc]initWithFrame:CGRectZero];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    
    
    _weiboTable.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_reload)];
    
}
- (void)_reload{
    NSLog(@"正在加载");
    [self loginWithoutButton];
    [_weiboTable reloadData];
    [self.view setNeedsLayout];
    [self performSelector:@selector(loadFinish) withObject:nil afterDelay:3];
}

- (void)loadFinish{
    NSLog(@"加载完毕");
    [_weiboTable.header endRefreshing ];
    
}

- (void)addLoginButton{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 70, 40, 40)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton*)button{
    SinaWeibo *sinaweibo = [self sinaweibo];
    if ([sinaweibo isAuthValid]) {
        NSLog(@"already login");
        NSDictionary *params = @{@"count":@"20"};
        [sinaweibo requestWithURL:@"statuses/home_timeline.jason"
                           params:[params mutableCopy]
                   httpMethod:@"GET"
                     delegate:self];
    }
    else{
        [sinaweibo logIn];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
  //  [self addLoginButton];
    [self addWeiboTable];
    [self loginWithoutButton];
}

- (SinaWeibo *)sinaweibo{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}

- (void)loginWithoutButton{
    SinaWeibo *sinaweibo = [self sinaweibo];
    if ([sinaweibo isAuthValid]) {
        NSLog(@"already login");
        NSDictionary *params = @{@"count":@"50"};
        [sinaweibo requestWithURL:@"statuses/home_timeline.json"
                           params:[params mutableCopy]
                       httpMethod:@"GET"
                         delegate:self];
    }
    else{
        [sinaweibo logIn];
    }
}

- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"fail %@",error);
}

- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    //NSLog(@"did finish loading with result.");
    NSArray *status = [result objectForKey:@"statuses"];
    NSMutableArray *layoutFrameArray = [[NSMutableArray alloc]initWithCapacity:status.count];
    for (NSDictionary *dataDictionary in status) {
        weiboModel *model = [[weiboModel alloc]initWithDataDic:dataDictionary];
        weiboLayoutFrame *layoutFrame = [[weiboLayoutFrame alloc]init];
        layoutFrame.weiboModel = model;
        [layoutFrameArray addObject:layoutFrame];
        NSLog(@"%@ : %@",layoutFrame.weiboModel.weiboId,layoutFrame.weiboModel.source);
    }
    _weiboTable.layoutFrameArray = layoutFrameArray;
    [_weiboTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
