//
//  DMHomeViewModel.m
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeViewModel.h"

@implementation DMHomeViewModel

-(void)onGotoTabClicked{
    [AJUtil toast:@"onGotoTabClicked"];
    [DMNaviService pushViewController:@"DMTabHomeViewController"];
}

-(void)onPushBlankClicked{
    [DMNaviService pushViewController:@"DMHomeViewController"];
}

@end
