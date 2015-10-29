//
//  DMHomeViewModel.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeViewModel.h"
#import "AJScrollViewController.h"

@implementation DMHomeViewModel

-(void)onSetNaviRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setRootViewController:@"DMHomeViewController"];
}

-(void)onSetTabRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setRootViewController:@"DMTabHomeViewController"];
}


-(void)onPushBlankClicked{
    AJScrollViewController *vc = (AJScrollViewController*)[DMNaviService pushViewController:@"DMHomeViewController"];

    [vc.scrollView setDMHeaderViewInHolder:vc withRefreshBlock:^(AJRefreshViewCompleteBlock completion) {
        [AJUtil toast:@"aaaaa"];
        completion(2);
    }];
    [vc.scrollView setDMFooterViewInHolder:vc withRefreshBlock:^(AJRefreshViewCompleteBlock completion) {
        [AJUtil toast:@"bbbb"];
        completion(2);
    }];
}

-(void)onLoadingClicked{
    [AJUtil showLoading];
    runBlockAfterDelay(3, ^{
        [AJUtil hideLoading];
    });
    
    AJSettings *settings = [AJSettings sharedInstance];
    settings.defaultDict = @{@"key1":@"value1"};
    
    [AJSettings setObject:@"value2" forKey:@"key2"];
    [AJSettings setObject:@"value1111" forKey:@"key1"];
    [AJUtil toast:[AJSettings objectForKey:@"key1"]];
    
    runBlockAfterDelay(3, ^{
        [AJSettings removeAllKeys];
        [AJUtil toast:[AJSettings objectForKey:@"key1"]];
    });
    
}

@end
