//
//  VisitorView.h
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginActionDelegate <NSObject>

-(void)loginAction;

@end

@interface VisitorView : UIView

@property (nonatomic , strong) UIImageView * houseImgView;
@property (nonatomic , strong) UIImageView * animationView;
@property (nonatomic , strong) UIImageView * mengbanView;
@property (nonatomic , strong) UILabel * textLable;
@property (nonatomic , strong) UIButton * loginBtn;
@property (nonatomic , weak) id<LoginActionDelegate>delegate;

-(void)setupVisitorIofo:(BOOL)isHome image:(NSString*)imageName message:(NSString*)message;
@end
