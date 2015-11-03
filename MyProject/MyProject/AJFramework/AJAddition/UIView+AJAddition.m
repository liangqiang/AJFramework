//
//  UIView+AJAddition.m
//  MyProject
//
//  Created by liangqiang on 15/10/22.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "UIView+AJAddition.h"
#import <objc/runtime.h>

@implementation UIView (AJAddition)

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.size.height;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.size.width;
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)left {
    return self.origin.x;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)top {
    return self.origin.y;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right-frame.size.width;
    self.frame = frame;
}

- (CGFloat)right {
    return self.left+self.width;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom-frame.size.height;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.top+self.height;
}

- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)handleClick:(UIViewClickBlock)handle {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, @selector(viewClick), handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)viewClick {
    UIViewClickBlock callBack = objc_getAssociatedObject(self, _cmd);
    if (callBack!= nil){
        callBack(self);
    }
}

- (UIView*)addLineWithY:(CGFloat)originY {
    CGFloat y = (originY==0) ? 0 : originY-LINE_HEIGHT;
    UIView *line =  [[UIView alloc] initWithFrame:CGRectMake(0, y, self.width, LINE_HEIGHT)];
    line.backgroundColor = HEXCOLOR(0xdddddd);
    [self addSubview:line];
    return line;
}

- (UIImage*)createImageWithScale:(CGFloat)scale{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *origPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return origPic;
}

-(void)setExtraData:(id)extraData{
    objc_setAssociatedObject(self, @selector(extraData),
                             extraData,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)extraData{
    return objc_getAssociatedObject(self, _cmd);
}

@end
