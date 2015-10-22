//
//  AJViewModel.m
//  alijkManager
//
//  Created by liangqiang on 15/9/1.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJViewModel.h"

@implementation AJViewModel

-(void)dealloc {
    NSLog(@"dealloc %@", self.description);
}

-(void) refreshView{
    if (_refreshBlock) {
        _refreshBlock();
    }
}

@end
