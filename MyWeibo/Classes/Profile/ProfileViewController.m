//
//  ProfileViewController.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/6.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "ProfileViewController.h"
#import "VisitorView.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    VisitorView * visitor = [[VisitorView alloc] init];
    VisitorView*visitor = [[VisitorView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = visitor;
    [visitor setupVisitorIofo:NO image:@"visitordiscover_image_profile" message:@"登录后，你的微博、相册、个人资料会显示在这里，展示给别人"];
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
