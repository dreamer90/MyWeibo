//
//  BaseTableViewController.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "BaseTableViewController.h"
#import "VisitorView.h"
#import "OAuthViewController.h"
#import "AccountTools.h"

@interface BaseTableViewController ()<LoginActionDelegate>

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)loadView{
    
    [super loadView];
    BOOL login = [AccountTools account];

    if (!login) {
//        [self inSubViews];
    }
}

-(void)inSubViews{
    /*
    if (!_visitor) {
        _visitor = [[VisitorView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _visitor.delegate = self;
        self.view = _visitor;
    }
     */
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


@end
