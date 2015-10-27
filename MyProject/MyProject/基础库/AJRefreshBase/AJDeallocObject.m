//
//  AJDeallocObject.m
//  MyProject
//
//  Created by liangqiang on 15/10/27.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AJDeallocObject.h"

@implementation AJDeallocObject

- (void)dealloc{
    if (self.deallocBlock != nil) {
        self.deallocBlock();
    }
}

@end

static char keyNSObjectDeallocObject;
@implementation NSObject (AJDeallocObject)

-(void)bindDeallocBlock:(AJDeallocBlock)deallocBlock{
    if (deallocBlock == nil) {
        return;
    }
    
    AJDeallocObject *obj = [AJDeallocObject new];
    [obj setDeallocBlock:^{
        deallocBlock();
    }];
    objc_setAssociatedObject(self, &keyNSObjectDeallocObject, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end