//
//  SXUIButtonAdditions.m
//  TPO
//
//  Created by SunX on 14-5-20.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import "UIControl+AJAddition.h"
#import <objc/runtime.h>

static char *keyEventBlock;

@implementation UIControl (AJAddition)

- (void)handleEvent:(UIControlEvents)aEvent withBlock:(UIControlEventBlock)eventBlock;
{
    objc_setAssociatedObject(self, &keyEventBlock, eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(handleEvent) forControlEvents:aEvent];
}

- (void)handleEvent {
    UIControlEventBlock callBack = objc_getAssociatedObject(self, &keyEventBlock);
    if (callBack!= nil){
        callBack(self);
    }
}

@end
