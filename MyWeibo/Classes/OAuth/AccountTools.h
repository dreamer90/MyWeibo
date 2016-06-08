//
//  AccountTools.h
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserAccount.h"

@interface AccountTools : NSObject

//存储帐号
+ (void)saveAccount:(UserAccount *)account;
//返回账户信息
+ (UserAccount*)account;
@end
