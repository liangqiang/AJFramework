//
//  WDHomeButtonItem.m
//  MyProject
//
//  Created by liangqiang on 16/2/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDButtonItem.h"

@implementation WDButtonItem

+(instancetype)newWithTitle:(NSString*)title selector:(SEL)selector{
    WDButtonItem *item = [WDButtonItem new];
    item.title = title;
    item.selector = selector;
    return item;
}

@end
