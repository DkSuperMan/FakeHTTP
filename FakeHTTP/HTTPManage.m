//
//  HTTPManage.m
//  FakeHTTP
//
//  Created by 陈金 on 15/10/24.
//  Copyright © 2015年 Art. All rights reserved.
//

#import "HTTPManage.h"

#define API_BASE_URL_STRING     @""//@"http://121.43.103.149:8002"

@implementation HTTPManage


+ (instancetype)sharedManage {
    static HTTPManage *_sharedNetWorkManage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //config AFHTTPRequestOperationManager
        _sharedNetWorkManage = [[HTTPManage alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL_STRING]];
        _sharedNetWorkManage.requestSerializer = [HTTPRequestSerializer serializer];//custom request header and body
        _sharedNetWorkManage.requestSerializer.timeoutInterval = 10;//set timeout
        _sharedNetWorkManage.responseSerializer = [AFHTTPResponseSerializer serializer];//custom response parsing
        _sharedNetWorkManage.responseSerializer.acceptableContentTypes = [_sharedNetWorkManage.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];//add parse html type content
        _sharedNetWorkManage.securityPolicy.allowInvalidCertificates = YES;
#warning need test maxConcurrentOperationCount,default is 10
        _sharedNetWorkManage.operationQueue.maxConcurrentOperationCount = 10;
        
        [_sharedNetWorkManage.reachabilityManager startMonitoring];
        
    });
    
    return _sharedNetWorkManage;
}

- (void)sendMonReq:(NSString*)url
{
//    return;
    [self GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
