//
//  UserAccount.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "UserAccount.h"
#import "NetworkTools.h"
#import "AccountTools.h"

#define HWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation UserAccount
static UserAccount * account;


+(id)changeWithDic:(NSDictionary*)dict{

//    [self setValuesForKeysWithDictionary:dict];
    UserAccount * account = [[self alloc] init];
    account.access_token  = dict[@"access_token"];
    account.expires_in  = dict[@"expires_in"];
    account.uid  = dict[@"uid"];
    account.created_time = [NSDate date];
    return account;
}
/*
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
*/
-(void)setExpires_in:(NSNumber *)expires_in{

}

-(void)loadUserInfo
{
    NSString * urlStr = @"2/users/show.json";
    NSDictionary * dict = @{@"access_token":self.access_token,@"uid":self.uid};
    //发送请求
    NetworkTools * tools = [NetworkTools sharedNetworkTools];
    [tools GET:urlStr parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.name = responseObject[@"name"];
        self.avatar_large = dict[@"avatar_large"];
        
        //保存用户信息
        [AccountTools saveAccount:self];
        
        // 切换窗口的根控制器
        [[NSNotificationCenter defaultCenter] postNotificationName:@"rootViewController" object:nil];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.created_time forKey:@"created_time"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in   = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid          = [aDecoder decodeObjectForKey:@"uid"];
        self.created_time = [aDecoder decodeObjectForKey:@"created_time"];
        self.name   = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

@end
