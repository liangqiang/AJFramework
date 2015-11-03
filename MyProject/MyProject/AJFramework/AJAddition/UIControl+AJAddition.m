//
//  SXUIButtonAdditions.m
//  TPO
//
//  Created by SunX on 14-5-20.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import "UIControl+AJAddition.h"
#import <objc/runtime.h>

@implementation UIControl (AJAddition)

- (void)handleEvent:(UIControlEvents)aEvent withBlock:(UIControlEventBlock)eventBlock;
{
    objc_setAssociatedObject(self, @selector(handleEvent), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(handleEvent) forControlEvents:aEvent];
}

- (void)handleEvent {
    UIControlEventBlock callBack = objc_getAssociatedObject(self, _cmd);
    if (callBack!= nil){
        callBack(self);
    }
}

@end
