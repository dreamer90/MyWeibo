//
//  MyNavgationViewController.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/6.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "MyNavgationViewController.h"

@interface MyNavgationViewController ()

@end

@implementation MyNavgationViewController

+(void)initialize
{
    //设置整个项目的主体样式
    UINavigationBar * item = [UINavigationBar appearance];
    
    //设置普通状态
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]  = [UIFont systemFontOfSize:17];
    attrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:attrs];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
