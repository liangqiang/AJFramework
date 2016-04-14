//
//  AJViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/4/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@implementation AJViewModel

-(void)notifyToRefresh{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

@end
