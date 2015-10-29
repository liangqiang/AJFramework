//
//  AJScrollView.h
//  alijkManager
//
//  Created by liangqiang on 15/8/28.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJScrollView : UIScrollView

@property (nonatomic, assign) NSInteger     contentHeight;
@property (nonatomic, assign) UIColor       *sectionColor; //背景色

-(UIView*) addSection:(NSInteger)height subviews:(NSArray*)views;
-(void)addBlank:(NSInteger)height;
-(void)removeAllSections;

@end
