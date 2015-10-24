//
//  HTTPRequestSerializer.m
//  FakeHTTP
//
//  Created by 陈金 on 15/10/24.
//  Copyright © 2015年 Art. All rights reserved.
//

#import "HTTPRequestSerializer.h"

@implementation HTTPRequestSerializer

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError * __autoreleasing *)error
{
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    
    [self.HTTPRequestHeaders enumerateKeysAndObjectsUsingBlock:^(id field, id value, BOOL * __unused stop) {
        if (![request valueForHTTPHeaderField:field]) {
            [mutableRequest setValue:value forHTTPHeaderField:field];
        }
    }];
    [mutableRequest setValue:@"FakeHTTP/1.0 (iPhone; iOS 8.3; Scale/2.00)" forHTTPHeaderField:@"User-Agent"];
    [mutableRequest setValue:@"en-US;q=1" forHTTPHeaderField:@"Accept-Language"];
    [mutableRequest setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [mutableRequest setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    return mutableRequest;
}

@end
