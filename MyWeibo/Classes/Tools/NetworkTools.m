//
//  NetworkTools.m
//  MyWeibo
//
//  Created by hyfsoft on 16/6/7.
//  Copyright © 2016年 hyfsoft. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+(id)sharedNetworkTools{
    
    static NetworkTools * network;
    static dispatch_once_t  once;
    dispatch_once(&once, ^{
        
       NSURL * baseUrl = [NSURL URLWithString:@"https://api.weibo.com/"];
        network = [[NetworkTools alloc] initWithBaseURL:baseUrl];
        network.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    });
    
    return network;
}

@end
