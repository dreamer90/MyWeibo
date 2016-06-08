//
//  NetworkTools.h
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkTools : AFHTTPSessionManager

+(id)sharedNetworkTools;

@end
