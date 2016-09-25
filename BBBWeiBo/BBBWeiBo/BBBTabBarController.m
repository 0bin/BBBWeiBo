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
///
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


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setAddButton];

}


/**
 添加button
 */
- (void)setAddButton
{
    [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    CGFloat width = self.addButton.currentBackgroundImage.size.width;
    CGFloat height = self.addButton.currentBackgroundImage.size.height;
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
    [self addTabBarChildVC:one Image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"One"];
    
    BBBTwoController *two = [[BBBTwoController alloc] init];
    [self addTabBarChildVC:two Image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_highlighted" title:@"Two"];
    
    BBBThreeController *three = [[BBBThreeController alloc] init];
    [self addTabBarChildVC:three Image:@"" selectedImage:@"" title:@""];
    
    BBBFourController *four = [[BBBFourController alloc] init];
    [self addTabBarChildVC:four Image:@"tabbar_discover" selectedImage:@"tabbar_discover_highlighted" title:@"Four"];
    
    BBBFiveController *five = [[BBBFiveController alloc] init];
    [self addTabBarChildVC:five Image:@"tabbar_profile" selectedImage:@"tabbar_profile_highlighted" title:@"Five"];
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
    
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.title = title;
    BBBNavigationController *nav = [[BBBNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}

@end
