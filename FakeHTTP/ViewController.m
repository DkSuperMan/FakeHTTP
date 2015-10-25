//
//  ViewController.m
//  FakeHTTP
//
//  Created by 陈金 on 15/10/24.
//  Copyright © 2015年 Art. All rights reserved.
//

#import "ViewController.h"
#import "HTTPManage.h"


@interface ViewController ()

@property(nonatomic,strong)NSMutableArray* urlArray;
@property(nonatomic,assign)NSInteger index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlArray = [[NSMutableArray alloc] initWithCapacity:10];
    
    NSString* taskUrl = @"http://adxoo.dj.linkdsp.com/api/c/0A6xB_0A75x?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
    
    taskUrl = @"http://wgepc.dj.linkdsp.com/api/c/0A6xB_09xCx?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
    
    taskUrl = @"http://mrrdz.dj.linkdsp.com/api/c/0A6xB_0A6xz?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
//
//    taskUrl = @"http://xcd81.dj.linkdsp.com/api/c/09z9K_09xCx?from=singlemessage&isappinstalled=1";
//    [self.urlArray addObject:taskUrl];
//    
//    taskUrl = @"http://jqbhk.dj.linkdsp.com/api/c/0A1kh_09xCx?from=singlemessage&isappinstalled=1";
//    [self.urlArray addObject:taskUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMonAction:(id)sender
{
    self.index = 0;
    [self startTask];
}

- (void)startTask
{
    NSLog(@"index is %ld",(long)self.index);
    
    [[HTTPManage sharedManage] sendMonReq:[self.urlArray objectAtIndex:self.index]];
    NSInteger tempIndex = self.index + 1;
    self.index = (tempIndex) % [self.urlArray count];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if(self.index == 0){
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"结束" message:@"更换cookie和ip地址" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            
            [self clearCookie];
            
        }else{
            [self startTask];
        }
        
        
    });
}

- (void)clearCookie
{
    //清空cookie
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *tmpArray = [NSArray arrayWithArray:[cookieJar cookies]];
    for (id obj in tmpArray) {
        [cookieJar deleteCookie:obj];
    }
}
@end
