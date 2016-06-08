//
//  DiscoverViewController.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "DiscoverViewController.h"
#import "VisitorView.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    VisitorView * visitor = [[VisitorView alloc] init];
    VisitorView*visitor = [[VisitorView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = visitor;
    [visitor setupVisitorIofo:NO image:@"visitordiscover_image_message" message:@"登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"];
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
