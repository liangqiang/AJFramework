//
//  NSObject+AJViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/1/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "NSObject+AJViewModel.h"

@implementation NSObject (AJViewModel)

-(void)setRefreshBlock:(AJRefreshBlock)refreshBlock{
    objc_setAssociatedObject(self, @selector(refreshBlock),
                             refreshBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(AJRefreshBlock)refreshBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)refresh{
    if (self.refreshBlock) {
        self.refreshBlock();
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
