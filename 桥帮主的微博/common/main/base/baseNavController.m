//
//  baseNavController.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/19.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "baseNavController.h"
#import "themeManager.h"

#import "UIViewController+MMDrawerController.h"
@interface baseNavController ()

@end

@implementation baseNavController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadImage) name:themeDidChangeNotification object:nil];
    }
    return self;
}

- (void)loadImage{
    themeManager *manager = [themeManager shareInstance];
    NSString *imageName = @"mask_titlebar64.png";
    // >> 主题管家通过图片名字获得图片
    UIImage *bgImage = [manager getThemeImage:imageName];
    
    [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    //02 设置导航栏 tilte 颜色 Mask_Title_color
    //NSAttributedString.h
    UIColor *titleColor = [manager getThemeColor:@"Mask_Title_color"];
    //titleColor = [UIColor blueColor];
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:
                                     titleColor
                                 };
    
    self.navigationBar.titleTextAttributes = attributes;
    //03 修改返回按钮的颜色
    self.navigationBar.tintColor = titleColor;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[manager getThemeImage:@"bg_home.jpg"]]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"a" style:UIBarButtonItemStylePlain target:self action:@selector(leftAct)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"b" style:UIBarButtonItemStylePlain target:self action:@selector(rightAct)];
    
    
    UIImage *img = [manager getThemeImage:@"bg_home.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:img];
    
    

}



- (void)leftAct{
    
}

- (void)rightAct{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImage];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
