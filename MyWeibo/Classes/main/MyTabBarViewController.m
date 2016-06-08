//
//  MyTabBarViewController.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/6.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "MessageViewController.h"
#import "MyNavgationViewController.h"

@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //首页
    HomeViewController * homeCtr = [[HomeViewController alloc] init];
    [self loadTabbarController:homeCtr title:@"首页" imageName:@"tabbar_home" ];
    //消息
    MessageViewController * messageCtr = [[MessageViewController alloc] init];
    [self loadTabbarController:messageCtr title:@"消息" imageName:@"tabbar_message_center" ];
    //发现
    DiscoverViewController * discoverCtr = [[DiscoverViewController alloc] init];
    [self loadTabbarController:discoverCtr title:@"发现" imageName:@"tabbar_discover" ];
    //我
    ProfileViewController * profileCtr = [[ProfileViewController alloc] init];
    [self loadTabbarController:profileCtr title:@"我" imageName:@"tabbar_profile" ];
}

-(void)loadTabbarController:(UIViewController*)controller title:(NSString*)title imageName:(NSString *)imageName {
    
    controller.title = title;
    self.tabBar.tintColor = [UIColor orangeColor];
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    
    MyNavgationViewController * nav = [[MyNavgationViewController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
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
