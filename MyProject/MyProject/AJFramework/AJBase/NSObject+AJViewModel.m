//
//  NSObject+AJViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/1/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "NSObject+AJViewModel.h"

@implementation NSObject (AJViewModel)

-(void)setAjRefreshBlock:(AJRefreshBlock)ajRefreshBlock{
    objc_setAssociatedObject(self, @selector(ajRefreshBlock),
                             ajRefreshBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(AJRefreshBlock)ajRefreshBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)ajRefresh{
    if (self.ajRefreshBlock) {
        self.ajRefreshBlock();
    }
}

-(void)setHolder:(id)holder{
    objc_setAssociatedObject(self, @selector(holder),
                             holder,
                             OBJC_ASSOCIATION_ASSIGN);
}

-(id)holder{
    return objc_getAssociatedObject(self, _cmd);
}

@end
