//
//  AccountTools.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "AccountTools.h"

// 账号的存储路径
#define HWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation AccountTools

+ (void)saveAccount:(UserAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:HWAccountPath];
}


+ (UserAccount *)account
{
    UserAccount * account = [NSKeyedUnarchiver unarchiveObjectWithFile:HWAccountPath];
    //过期的秒数
    long long expires_in = [account.expires_in longLongValue];
    //获得过期时间
    NSDate * expiresTime = [account.created_time dateByAddingTimeInterval:expires_in];
    //当前时间
    NSDate * now= [NSDate date];
    
    NSComparisonResult result = [expiresTime compare:now];
    
    /*
    if (result != NSOrderedDescending) {
        return  nil;
    }
     */
    return account;
}
@end
