//
//  DMHomeViewModel.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeViewModel.h"
#import "AJSectionItem.h"
#import "DMHomeCellItem.h"

@implementation DMHomeViewModel
-(instancetype)init{
    self = [super init];
    if (self) {
        _sectionArray = [NSMutableArray array];
        [_sectionArray addObject:[AJSectionItem new]];
    }
    return self;
}

-(void)loadTableData{
    AJSectionItem *sectionItem = [self.sectionArray firstObject];
    NSArray *properties = @[@{@"title":@"Set Navi Root", @"clickSel":@"onSetNaviRootClicked"},
                            @{@"title":@"Set Tab Root", @"clickSel":@"onSetTabRootClicked"},
                            @{@"title":@"push页面（带上下拉刷新）", @"clickSel":@"onPushBlankClicked"},
                            @{@"title":@"测试正在加载", @"clickSel":@"onLoadingClicked"},
                            @{@"title":@"测试coreText", @"clickSel":@"onCoreTextDemoClicked"},
                            @{@"title":@"测试animation", @"clickSel":@"onAnimationClicked"},];
    for (NSDictionary *property in properties) {
        DMHomeCellItem *item = [DMHomeCellItem new];
        [item safeSetProperty:property];
        [sectionItem.cellDataArray addObject:item];
    }
}

-(void)onCellClicked:(NSIndexPath*)indexPath{
    AJSectionItem *sectionItem = [self.sectionArray firstObject];
    DMHomeCellItem *item = [sectionItem.cellDataArray safeObjectAtIndex:indexPath.row];

    runSelector(self, NSSelectorFromString(item.clickSel));
}

//-(NSMutableArray*)buttons{
//    if (_buttons == nil) {
//        _buttons = [NSMutableArray array];
//        
//        [self addButton:@"Set Navi Root" clickSel:@selector(onSetNaviRootClicked)];
//        [self addButton:@"Set Tab Root" clickSel:@selector(onSetTabRootClicked)];
//        [self addButton:@"push页面（带上下拉刷新）" clickSel:@selector(onPushBlankClicked)];
//        [self addButton:@"测试正在加载" clickSel:@selector(onLoadingClicked)];
//        [self addButton:@"测试coreText" clickSel:@selector(onCoreTextDemoClicked)];
//        [self addButton:@"测试auto layout" clickSel:@selector(onAutoLayoutClicked)];
//        [self addButton:@"测试animation" clickSel:@selector(onAnimationClicked)];
//    }
//    return _buttons;
//}
//
//-(void)addButton:(NSString*)title clickSel:(SEL)aSelector{
//    DMHomeButtonItem *item = [DMHomeButtonItem new];
//    item.title = title;
//    item.clickSel = NSStringFromSelector(aSelector);
//    [_buttons addObject:item];
//}

-(void)onSetNaviRootClicked{
    [AJUtil toast:@"onSetNaviRootClicked"];
    [DMNaviService setRootViewController:@"DMHomeViewController" withProp:@{@"title":@"首页"}];
}

-(void)onSetTabRootClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService setRootViewController:@"DMTabHomeViewController"];
}

-(void)onPushBlankClicked{
    NSString *title = [NSString stringWithFormat:@"%u", arc4random()];
    [DMNaviService pushViewController:@"DMHomeViewController" withProp:@{@"title":title}];

//    AJScrollViewController *vc = (AJScrollViewController*)[DMNaviService pushViewController:@"DMHomeViewController"];
//    __weak AJScrollViewController *weakVc = vc;
//    //添加下拉上拉刷新
//    [vc.scrollView setDMRefreshHolder:vc];
//    [vc.scrollView setDMRefreshHeaderBlock:^{
//        [AJUtil toast:@"aaaaa"];
//        runBlockAfterDelay(2, ^{
//            [weakVc.scrollView stopRefresh];
//        });
//    }];
//    [vc.scrollView setDMRefreshFooterBlock:^{
//        [AJUtil toast:@"bbbb"];
//        runBlockAfterDelay(2, ^{
//            [weakVc.scrollView stopRefresh];
//        });
//    }];
    
//    [vc.scrollView setDMRefreshHeaderBlock:^{
//        [AJUtil toast:@"aaaaa"];
//        runBlockAfterDelay(2, ^{
//            [weakVc.scrollView stopRefresh];
//        });
//    } footerBlock:^{
//        [AJUtil toast:@"bbbb"];
//        runBlockAfterDelay(2, ^{
//            [weakVc.scrollView stopRefresh];
//        });
//    } inHolder:vc];
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

-(void)onAnimationClicked{
    [DMNaviService pushViewController:@"DMAnimation1ViewController" ];
}

@end
