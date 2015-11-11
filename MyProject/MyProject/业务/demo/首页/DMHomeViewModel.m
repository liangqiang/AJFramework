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
-(instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

-(NSMutableArray*)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
        [self addButton:@"Set Navi Root" clickSel:@selector(onSetNaviRootClicked)];
        [self addButton:@"Set Tab Root" clickSel:@selector(onSetTabRootClicked)];
        [self addButton:@"push页面（带上下拉刷新）" clickSel:@selector(onPushBlankClicked)];
        [self addButton:@"测试正在加载" clickSel:@selector(onLoadingClicked)];
        [self addButton:@"测试coreText" clickSel:@selector(onCoreTextDemoClicked)];
        [self addButton:@"测试auto layout" clickSel:@selector(onAutoLayoutClicked)];
    }
    return _buttons;
}

-(void)addButton:(NSString*)title clickSel:(SEL)aSelector{
    DMHomeButtonItem *item = [DMHomeButtonItem new];
    item.title = title;
    item.clickSel = NSStringFromSelector(aSelector);
    [_buttons addObject:item];
}

-(void)onSetNaviRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setFirstViewController:@"DMHomeViewController"];
}

-(void)onSetTabRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setFirstViewController:@"DMTabHomeViewController"];
}

-(void)onPushBlankClicked{
    AJScrollViewController *vc = (AJScrollViewController*)[DMNaviService pushViewController:@"DMHomeViewController"];
    __weak AJScrollViewController *weakVc = vc;
    //添加下拉上拉刷新
    [vc.scrollView setDMRefreshHeaderBlock:^{
        [AJUtil toast:@"aaaaa"];
        runBlockAfterDelay(2, ^{
            [weakVc.scrollView stopRefresh];
        });
    } footerBlock:^{
        [AJUtil toast:@"bbbb"];
        runBlockAfterDelay(2, ^{
            [weakVc.scrollView stopRefresh];
        });
    } inHolder:vc];
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

-(void)onCoreTextDemoClicked{
    [DMNaviService pushViewController:@"TBCityCoreTextDemoViewController" ];
    
    //http://didayun.duapp.com/antman/getEntity?entityId=ETT20150721000455520
    //{"resultCode": 0, "entity": {"entityId": "ETT20150721000455520", "featureName": "", "entityName": "\u6bdb\u6cfd\u4e1c", "uniqueName": "\u6bdb\u6cfd\u4e1c"}}
    MKNetworkHost *host = [[MKNetworkHost alloc]initWithHostName:@"didayun.duapp.com"];
    MKNetworkRequest *request = [host requestWithPath:@"/antman/getEntity" params:@{@"entityId":@"ETT20150721000455520"}];
    [request addCompletionHandler:^(MKNetworkRequest *completedRequest) {
        [AJUtil toast:@"request finished"];
        NSDictionary *entity = completedRequest.responseAsJSON[@"entity"];
        NSLog(@"entityName:%@", entity[@"entityName"]);
    }];
    [host startRequest:request];
}

-(void)onAutoLayoutClicked{
    [DMNaviService pushViewController:@"DMAutoLayoutViewController" ];
}

@end

@implementation DMHomeButtonItem

@end
