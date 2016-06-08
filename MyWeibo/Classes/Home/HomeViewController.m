//
//  HomeViewController.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/6.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "HomeViewController.h"
#import "VisitorView.h"
#import "OAuthViewController.h"
#import "AccountTools.h"
#import "NetworkTools.h"
#import "MJExtension.h"
#import "MyStatus.h"
#import "StatusTableViewCell.h"

@interface HomeViewController ()<LoginActionDelegate>

@property (nonatomic , strong) NSArray * statuses;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserAccount * login =  [AccountTools account];
    if (!login) {
        VisitorView*visitor = [[VisitorView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.view = visitor;
        visitor.delegate = self;
        [visitor setupVisitorIofo:YES image:@"visitordiscover_feed_image_house" message:@"关注一些人，回这里看看有什么惊喜"];
    }
    
    [self loadNewStatus];
}

-(void)loadNewStatus
{
    NSString * urlStr = @"2/statuses/home_timeline.json";
    NSDictionary * dict = @{@"access_token":[AccountTools account].access_token};
    //发送请求
    NetworkTools * tools = [NetworkTools sharedNetworkTools];
    [tools GET:urlStr parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 将 "微博字典"数组 转为 "微博模型"数组
        NSArray *newStatuses = [MyStatus mj_objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        _statuses = [self modelState:newStatuses];
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(NSArray*)modelState:(NSArray *)arr{
    NSMutableArray * models = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary * dict in arr) {
        MyStatus * status = [MyStatus mj_objectWithKeyValues:dict];
        [models addObject:status];
    }
    
    return models;
}

-(void)loginAction{
    OAuthViewController * oauth = [[OAuthViewController alloc] init];
    [self presentViewController:oauth animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusTableViewCell * cell = [StatusTableViewCell cellWithTableView:tableView];
    cell.status = self.statuses[indexPath.row];
    
    return cell;
}

@end
