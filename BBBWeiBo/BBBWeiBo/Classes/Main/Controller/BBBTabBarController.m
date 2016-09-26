//
//  BBBTabBarController.m
//  BBBWeiBo
//
//  Created by LinBin on 16/9/25.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBTabBarController.h"
#import "BBBNavigationController.h"
#import "BBBOneController.h"
#import "BBBTwoController.h"
#import "BBBThreeController.h"
#import "BBBFourController.h"
#import "BBBFiveController.h"
#import "BBBPlusController.h"

@interface BBBTabBarController ()
/** tabBar中间button  */
@property (strong, nonatomic) UIButton *addButton;
@end

@implementation BBBTabBarController

- (UIButton *)addButton
{
    if (_addButton == nil) {
        _addButton = [[UIButton alloc]init];
    }
    return _addButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildVC];

    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setAddButton];
}


/**
 添加tabBar中间button
 */
- (void)setAddButton
{
    [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    CGFloat width = self.addButton.currentBackgroundImage.size.width;
    CGFloat height =  self.addButton.currentBackgroundImage.size.height;
    CGFloat centerX = self.tabBar.bounds.size.width * 0.5;
    CGFloat centerY = self.tabBar.bounds.size.height * 0.5;
    
    self.addButton.frame = CGRectMake(0, 0, width, height);
    self.addButton.center = CGPointMake(centerX, centerY);
    [self.addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:self.addButton];

}


- (void)addButtonClick
{
    BBBPlusController *addVC = [[BBBPlusController alloc] init];
    [self presentViewController:addVC animated:YES completion:nil];
    
}


/**
    添加子控制器
 */
- (void)addChildVC
{
    BBBOneController *one = [[BBBOneController alloc] init];
    [self addTabBarChildVC:one Image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"首页"];
    
    BBBTwoController *two = [[BBBTwoController alloc] init];
    [self addTabBarChildVC:two Image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_highlighted" title:@"消息"];
    
    BBBThreeController *three = [[BBBThreeController alloc] init];
    [self addTabBarChildVC:three Image:@"" selectedImage:@"" title:@""];
    
    BBBFourController *four = [[BBBFourController alloc] init];
    [self addTabBarChildVC:four Image:@"tabbar_discover" selectedImage:@"tabbar_discover_highlighted" title:@"发现"];
    
    BBBFiveController *five = [[BBBFiveController alloc] init];
    [self addTabBarChildVC:five Image:@"tabbar_profile" selectedImage:@"tabbar_profile_highlighted" title:@"我"];
}


/**
 *  添加TabBar子控制器方法
 *
 *  @param childVC       传入控制器
 *  @param image         图片
 *  @param selectedImage 选中图片
 *  @param title         标题
 */
- (void)addTabBarChildVC:(UIViewController *)childVC Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    [childVC setTitle:title];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor grayColor];
    [childVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    NSMutableDictionary *selDict = [NSMutableDictionary dictionary];
    selDict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVC.tabBarItem setTitleTextAttributes:selDict forState:UIControlStateSelected];
    [childVC.tabBarItem setImage:[UIImage imageNamed:image]];
    [childVC.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    BBBNavigationController *nav = [[BBBNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}

@end
