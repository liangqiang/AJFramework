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

-(void)addSubviews:(UIView*)firstView, ... NS_REQUIRES_NIL_TERMINATION{
    va_list args;
    va_start(args, firstView); // scan for arguments after firstObject.
    // get rest of the objects until nil is found
    for (UIView *subview=firstView; subview!=nil; subview = va_arg(args,UIView*)) {
        [self addSubview:subview];
    }
    va_end(args);
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

- (UIView*)addLineWithY:(CGFloat)originY color:(UIColor*)color{
    CGFloat y = (originY==0) ? 0 : originY-LINE_HEIGHT;
    UIView *line =  [[UIView alloc] initWithFrame:CGRectMake(0, y, self.width, LINE_HEIGHT)];
    line.backgroundColor = color;
    [self addSubview:line];
    return line;
}

- (UIView*)addLineWithX:(CGFloat)originX color:(UIColor*)color{
    CGFloat x = (originX==0) ? 0 : originX-LINE_HEIGHT;
    UIView *line =  [[UIView alloc] initWithFrame:CGRectMake(x, 0, LINE_HEIGHT, self.height)];
    line.backgroundColor = color;
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

////cornerRadius
//-(void)setCornerRadius:(CGFloat)radius {
//    self.layer.cornerRadius = radius;
//    self.clipsToBounds = YES;
//}
//
////borderWidth, borderColor
//-(void)setBorderWidth:(CGFloat)width color:(UIColor*)color{
//    self.layer.borderWidth = width;
//    self.layer.borderColor = color.CGColor;
//}

-(void)layoutWithInsets:(UIEdgeInsets)insets{ //
    NSAssert(self.superview, @"superview must exist");
    if (insets.left == EAuto && insets.right == EAuto) { //居中
        self.left = (self.superview.width - self.width)/2.0;
    }
    else if(insets.right == EAuto){ //左对齐
        self.left = insets.left;
    }
    else if(insets.left == EAuto){ //右对齐
        self.right = self.superview.width - insets.right;
    }
    else{ //左右对齐
        self.width = self.superview.width - insets.left - insets.right;
        self.left = insets.left;
    }
    
    if (insets.top == EAuto && insets.bottom == EAuto) { //居中
        self.top = (self.superview.height - self.height)/2.0;
    }
    else if(insets.bottom == EAuto){ //上对齐
        self.top = insets.top;
    }
    else if(insets.top == EAuto){ //下对齐
        self.bottom = self.superview.height - insets.bottom;
    }
    else{ //上下对齐
        self.height = self.superview.height - insets.top - insets.bottom;
        self.top = insets.top;
    }
}

@end
