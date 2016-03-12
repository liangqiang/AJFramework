//
//  UIScrollView+AJAddition.h
//  MyProject
//
//  Created by liangqiang on 15/12/9.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIScrollView (AJAddition)

@property (nonatomic, assign) NSInteger     contentHeight;

-(void)addBlankSection:(NSInteger)height;
-(void)addSection:(UIView*)section;
-(void)removeAllSections;

@end
