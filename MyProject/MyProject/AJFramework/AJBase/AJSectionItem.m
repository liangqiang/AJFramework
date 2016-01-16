//
//  AJTableSection.m
//  MyProject
//
//  Created by liangqiang on 15/12/7.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AJSectionItem.h"

@implementation AJSectionItem

-(instancetype)init{
    if (self=[super init]) {
        _cellDataArray = [NSMutableArray array];
    }
    return self;
}

@end
