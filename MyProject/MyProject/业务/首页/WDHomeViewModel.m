//
//  WDHomeViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/2/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDHomeViewModel.h"

@implementation WDHomeViewModel

-(void)loadData{
    self.buttonArray = [NSMutableArray arrayWithArray:
  @[
    [WDButtonItem newWithTitle:@"阿剑框架功能Demo" selector:@selector(onFrameworkDemoClicked)],
    [WDButtonItem newWithTitle:@"iPhone课件Demo" selector:@selector(onIphoneDemoClicked)]
    ]];
    
    [self notifyToRefresh];
}

-(void)onFrameworkDemoClicked{
    [AJUtil toast:@"onFrameworkDemoClicked"];
    [AJNavi pushViewController:@"WDDemoListViewController"];
}

-(void)onIphoneDemoClicked{
    [AJUtil toast:@"onIphoneDemoClicked"];
}

@end
