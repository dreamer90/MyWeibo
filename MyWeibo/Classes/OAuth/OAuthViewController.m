//
//  OAuthViewController.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "OAuthViewController.h"
#import "NetworkTools.h"
#import "UserAccount.h"

@interface OAuthViewController ()<UIWebViewDelegate>



@end

@implementation OAuthViewController

NSString* const WB_Client_ID = @"1487522231";
NSString* const WB_REDIRECT_URI = @"http://www.520it.com";
NSString* const WB_App_Secret = @"ee430014d01396446d015a79584708d1";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadOAuthPage];
}

-(void)loadOAuthPage
{
    NSString * urlString = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",WB_Client_ID,WB_REDIRECT_URI];
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    UIWebView * web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.view  = web;
    web.delegate = self;
    [web loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString * urlStr = request.URL.absoluteString;
    if (![urlStr hasPrefix:WB_REDIRECT_URI]) {
        return YES;
    }
    
    NSString * query = request.URL.query;
    NSString * codeStr = @"code=";
    if ([query hasPrefix:codeStr]) {
        NSRange range = NSMakeRange(0, codeStr.length);
        NSString * code = [query substringFromIndex:range.length];
        [self loadAccessToken:code];
    }
    return NO;
}

-(void)loadAccessToken:(NSString *)codeStr
{
    NSString * urlStr = @"oauth2/access_token";
    
    NSDictionary * params = @{@"client_id": WB_Client_ID,
                                             @"client_secret": WB_App_Secret,
                                             @"grant_type": @"authorization_code",
                                             @"code": codeStr,
                                     @"redirect_uri": WB_REDIRECT_URI};
    NetworkTools *  tools = [NetworkTools sharedNetworkTools];
    [tools POST:urlStr parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        UserAccount * account = [UserAccount changeWithDic:responseObject];
        [account loadUserInfo];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

@end
