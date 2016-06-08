//
//  UserAccount.h
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAccount : NSObject<NSCoding>

@property (nonatomic , copy) NSString * access_token;
//过期时间
@property (nonatomic , copy) NSNumber * expires_in;
//真实过期时间
@property (nonatomic , strong) NSDate * expires_Date;
//用户ID
@property (nonatomic , copy) NSString * uid;
//用户名
@property (nonatomic , copy) NSString * name;
/**	access token的创建时间 */
@property (nonatomic, strong) NSDate *created_time;
//头像
@property (nonatomic , copy) NSString * avatar_large;

+(id)changeWithDic:(NSDictionary*)dict;

-(void)loadUserInfo;

@end
