//
//  HTTPManage.h
//  FakeHTTP
//
//  Created by 陈金 on 15/10/24.
//  Copyright © 2015年 Art. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "HTTPRequestSerializer.h"

@interface HTTPManage : AFHTTPRequestOperationManager

+ (instancetype)sharedManage;

- (void)sendMonReq:(NSString*)url;

@end
