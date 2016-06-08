//
//  StatusTableViewCell.h
//  MyWeibo
//
//  Created by hyfsoft on 16/6/8.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyStatus.h"

@interface StatusTableViewCell : UITableViewCell

@property (nonatomic , strong) MyStatus * status;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
