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
    
    NSString* taskUrl = @"http://fmgwn.dj.linkdsp.com/api/c/09z9K_0A75x?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
    
    taskUrl = @"http://nxnjy.dj.linkdsp.com/api/c/0A1kg_0A75x?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
    
    taskUrl = @"http://v85fc.dj.linkdsp.com/api/c/06d3k_0A75x?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
    
    taskUrl = @"http://xcd81.dj.linkdsp.com/api/c/09z9K_09xCx?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
    
    taskUrl = @"http://jqbhk.dj.linkdsp.com/api/c/0A1kh_09xCx?from=singlemessage&isappinstalled=1";
    [self.urlArray addObject:taskUrl];
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
    NSLog(@"index is %d",self.index);
    
    [[HTTPManage sharedManage] sendMonReq:[self.urlArray objectAtIndex:self.index]];
    NSInteger tempIndex = self.index + 1;
    self.index = (tempIndex) % [self.urlArray count];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self startTask];
        
    });
}
@end
