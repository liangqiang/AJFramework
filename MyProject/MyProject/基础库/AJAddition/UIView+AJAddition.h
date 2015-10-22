//
//  UIView+AJAddition.h
//  MyProject
//
//  Created by liangqiang on 15/10/22.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^UIViewClickBlock)(UIView *view);

@interface UIView (AJAddition)

/**
 *  orgin.x
 */
@property (nonatomic, assign) CGFloat left;
/**
 *  origin.y
 */
@property (nonatomic, assign) CGFloat top;
/**
 *  origin.x+width
 */
@property (nonatomic, assign) CGFloat right;
/**
 *  y+height
 */
@property (nonatomic, assign) CGFloat bottom;
/**
 *  view.frame.size.width 宽
 */
@property (nonatomic, assign) CGFloat width;
/**
 *  view.frame.size.height 高
 */
@property (nonatomic, assign) CGFloat height;
/**
 *  view.frame.origin
 */
@property (nonatomic, assign) CGPoint origin;
/**
 *  view.frame.size
 */
@property (nonatomic, assign) CGSize  size;
/**
 *  清空所有子view
 */
-(void)removeAllSubviews;
/**
 *  增加UIView的点击事件
 */
-(void)handleClick:(UIViewClickBlock)handle;

//增加一根线
- (UIView*)addLineWithY:(CGFloat)originY;

//当前view截图
- (UIImage*)createImageWithScale:(CGFloat)scale;

//保存额外信息
@property (nonatomic,strong) id userInfo;

@end
