//
//  NSObject+AJViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/1/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (AJViewModel)

@property (nonatomic,copy) AJVoidBlock ajRefreshBlock;

-(void)ajRefresh;

@end
