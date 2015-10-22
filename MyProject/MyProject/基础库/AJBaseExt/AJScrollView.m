//
//  AJScrollView.m
//  alijkManager
//
//  Created by liangqiang on 15/8/28.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJScrollView.h"

@interface AJScrollView ()


@end

@implementation AJScrollView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
//    self.contentOffset = CGPointMake(0, 0);
//    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _contentHeight = 0;
    _sectionColor = [UIColor clearColor];
    
    return self;
}

-(UIView*) addSection:(NSInteger)height subviews:(NSArray*)views{
    CGRect rect = CGRectMake(0, self.contentHeight, APP_SCREEN_WIDTH, height);
    UIView *container = [[UIView alloc]initWithFrame:rect];
    container.backgroundColor = _sectionColor;
    [self addSubview:container];
    self.contentHeight += height;
    [self setContentSize:CGSizeMake(self.width, _contentHeight)];
    
    for (UIView* view in views) {
        [container addSubview:view];
    }
    
    return container;
}

-(void)removeAllSections{
    [self removeAllSubviews];
    _contentHeight = 0;
    [self setContentSize:CGSizeMake(self.width, 0)];
//    NSLog(@"reset:%@", NSStringFromCGPoint(self.contentOffset));
//    self.contentOffset = CGPointMake(0, 0);
//    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
