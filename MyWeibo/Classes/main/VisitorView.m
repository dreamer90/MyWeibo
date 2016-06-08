//
//  VisitorView.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "VisitorView.h"
#import "UIView+XMGExtension.h"

@implementation VisitorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self inSubViews];
    }
    return self;
}

-(void)inSubViews
{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.animationView];
    [self addSubview:self.mengbanView];
    [self addSubview:self.houseImgView];
    [self addSubview:self.textLable];
    [self addSubview:self.loginBtn];
    
    _houseImgView.xmg_centerY   = APP_HEIGHT/2;
    _houseImgView.xmg_centerX   = self.center.x;
    _animationView.xmg_centerX  = _houseImgView.center.x;
    _animationView.xmg_centerY  = _houseImgView.center.y;
    _mengbanView.xmg_y          = _animationView.xmg_y;
    _textLable.xmg_y     = _houseImgView.xmg_y + _houseImgView.xmg_height+10;
    _loginBtn.frame = CGRectMake((APP_WIDTH-80)/2, _textLable.xmg_y+_textLable.xmg_height+10, 80, 30);
}

//动画
-(UIImageView *)animationView{
    if (!_animationView) {

        _animationView = [[UIImageView alloc] init];
        UIImage * animationImg      = [UIImage imageNamed:@"visitordiscover_feed_image_smallicon"];
        _animationView.image         = animationImg;
        _animationView.xmg_width     = animationImg.size.width;
        _animationView.xmg_height    = animationImg.size.height;
      
    }
    return _animationView;
}
//蒙板
-(UIImageView*)mengbanView{
    if (!_mengbanView) {

        _mengbanView = [[UIImageView alloc] init];
        _mengbanView.xmg_x         = 0;
        _mengbanView.xmg_y         = 0;
        _mengbanView.xmg_width     = APP_WIDTH;
        _mengbanView.xmg_height    = APP_HEIGHT;
        _mengbanView.image         = [UIImage imageNamed:@"visitordiscover_feed_mask_smallicon"];
    }
    return _mengbanView;
}
//房子图片
-(UIImageView*)houseImgView{
    if (!_houseImgView) {
        
        _houseImgView = [[UIImageView alloc] init];
        UIImage * houseImg         = [UIImage imageNamed:@"visitordiscover_feed_image_house"];
        _houseImgView.image         = houseImg;
        _houseImgView.xmg_width     = houseImg.size.width;
        _houseImgView.xmg_height    = houseImg.size.height;
    
    }
    return _houseImgView;
}

-(UILabel*)textLable{
    if (!_textLable) {
        UILabel * textLable = [[UILabel alloc] init];
        
        textLable.xmg_x     = 30;
        textLable.xmg_width = APP_WIDTH -60;
        textLable.xmg_height= 40;
        textLable.numberOfLines = 0;
        textLable.preferredMaxLayoutWidth = APP_WIDTH -60;
        textLable.textAlignment = NSTextAlignmentCenter;
        _textLable = textLable;
    }
    return _textLable;
}

//登录
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _loginBtn.backgroundColor = [UIColor grayColor];
        [_loginBtn addTarget:self action:@selector(visitorLogin) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

//开始动画
-(void)startAnimation{
    //创建动画
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    //设置动画属性
    anim.toValue  = [NSNumber numberWithDouble:2 * M_PI];
    anim.duration = 20;
    anim.repeatCount = MAXFLOAT;
     //true 动画执行完后默认会从页面删除
    anim.removedOnCompletion = NO;
    //添加动画
    [_animationView.layer addAnimation:anim forKey:nil];
}

-(void)setupVisitorIofo:(BOOL)isHome image:(NSString*)imageName message:(NSString*)message{

    _houseImgView.image = [UIImage imageNamed:imageName];
    _textLable.text     = message;
    _animationView.hidden = !isHome;
    if (isHome == YES) {
        [self startAnimation];
    }
    
}

-(void)visitorLogin{
    if ([self.delegate respondsToSelector:@selector(loginAction)]) {
       
        [self.delegate loginAction];
    }
}

@end
