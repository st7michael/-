//
//  mainViewController.m
//  桥帮主的微博
//
//  Created by Yiqiao on 15/8/19.
//  Copyright (c) 2015年 Yiqiao. All rights reserved.
//

#import "mainViewController.h"
#import "baseNavController.h"
#import "themeImageView.h"
#import "themeButton.h"
@interface mainViewController (){
    // UIImageView *_tabBarView;
    themeImageView *_tabBarView;
    themeImageView *_selectView;
}

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //create tabbar
    [self _createTabBar];
    //create views
    [self _createViewControllers];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_compose"]];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"mainViewController initWithNibName");
    }
    return  self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"mainViewController initWithCoder");
    }
    return self;
}

- (void)_createViewControllers{
    NSArray *names = @[@"home",@"message",@"publish",@"discover",@"profile"];
    for (NSString *name in names) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:name bundle:nil];
        baseNavController *nav = [storyBoard instantiateInitialViewController];
        [self addChildViewController:nav];
    }
    
    //first VC  below tabbar
    UIViewController *firstViewController = self.childViewControllers[0];
    [self.view insertSubview:firstViewController.view belowSubview:_tabBarView];
}

- (void)_createTabBar{
    for (UIView *view in _tabBarView.subviews) {
        
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }

    _tabBarView = [[themeImageView alloc]initWithFrame:CGRectMake(0, h-49, w, 49)];
    _tabBarView.imageName = @"mask_navbar.png";
    _tabBarView.userInteractionEnabled = YES;
    [self.view addSubview:_tabBarView];
    
    _selectView = [[themeImageView alloc]initWithFrame:CGRectMake(0, 0, w/5, 49)];
    [_tabBarView addSubview:_selectView];
    
    //tabbar backgground image
    _selectView.imageName = @"home_bottom_tab_arrow.png";
    
    //button iamges
    NSArray *imgNames = @[
                          @"home_tab_icon_1.png",
                          @"home_tab_icon_2.png",
                          @"home_tab_icon_3.png",
                          @"home_tab_icon_4.png",
                          @"home_tab_icon_5.png",
                          ];
    CGFloat buttonWidth = w/5.0;
    //add button
    for (int i = 0; i<imgNames.count; i++) {
        //UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(i*buttonWidth, 0, buttonWidth, 49);
//        button.tag = i;
        themeButton *button = [[themeButton alloc] initWithFrame:CGRectMake(buttonWidth*i, 0, buttonWidth, 49)];
        button.tag = i;
        NSString *name = imgNames[i];
        button.normalImageName = name;

      //  [button setImage:[UIImage imageNamed:imgNames[i]] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:button];
    }
}


- (void)buttonAction:(UIButton*)button{
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = button.center;
    }];
    [self selectAction:button.tag];
}

- (void)selectAction:(NSInteger)selectTag{
    if (_selectIndex != selectTag) {
        UIViewController *preVC = self.childViewControllers[_selectIndex];
        UIViewController *currentVC = self.childViewControllers[selectTag];
        [preVC.view removeFromSuperview];
        [self.view insertSubview:currentVC.view belowSubview:_tabBarView];
        _selectIndex = selectTag;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
