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
@property (nonatomic, assign) UIColor       *sectionBackColor;

-(UIView*) addSection:(NSInteger)height subviews:(NSArray*)views;
-(void)removeAllSections;

@end
