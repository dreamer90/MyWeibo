//
//  StatusTableViewCell.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/8.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "StatusTableViewCell.h"

@interface StatusTableViewCell()

@end

@implementation StatusTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    StatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[StatusTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
 
        // 初始化原创微博
//        [self setupOriginal];
        
        // 初始化转发微博
//        [self setupRetweet];
        
        // 初始化工具条
//        [self setupToolbar];

    }
    return self;
}


@end
