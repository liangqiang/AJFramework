//
//  DMUICommon.m
//  MyProject
//
//  Created by liangqiang on 15/11/4.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMUICommon.h"

//------------------------------------------------------------------------------
//内部函数
UIView *createLine(NSInteger y, NSInteger startX, NSInteger width){
    CGFloat posY = (y==0) ? 0 : y-LINE_HEIGHT;
    CGRect rect = CGRectMake(startX, posY, width, LINE_HEIGHT);
    UIView *line =  [[UIView alloc] initWithFrame:rect];
    line.backgroundColor = kSegmentLineColor;
    return line;
}


void addContainerLines(UIView *container, ESectionLineType lineType){
    if (lineType & ELineTop) {
        [container addSubview:createLine(0, 0, container.width)];
    }
    if (lineType & ELineTopShort) {
        [container addSubview:createLine(0, 15, container.width-15)];
    }
    if (lineType & ELineBottom) {
        [container addSubview:createLine(container.height, 0, container.width)];
    }
    if (lineType & ELineBottomShort) {
        [container addSubview:createLine(container.height, 15, container.width-15)];
    }
}

//------------------------------------------------------------------------------
UILabel* createLabel(NSString *text, UIFont *font, UIColor *textColor){
    return createLabelMulti(text, font, textColor, 10000, 1);
}

UILabel* createLabelMulti(NSString *text, UIFont *font, UIColor *textColor, NSInteger width, NSInteger numberOfLines){
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 10000)];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.numberOfLines = numberOfLines;
    [label sizeToFit];
    return label;
}


UIImageView *createImageView(UIImage *image, UIViewContentMode contentMode){
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.contentMode = contentMode;
    imageView.clipsToBounds = true;
    return imageView;
}

UIView *createContainer(NSInteger width, NSInteger height, NSArray *views, ESectionLineType lineType){
    CGRect rect = CGRectMake(0, 0, width, height);
    UIView *container = [[UIView alloc]initWithFrame:rect];
    container.backgroundColor = [UIColor whiteColor];
    for (UIView* view in views) {
        [container addSubview:view];
    }
    addContainerLines(container, lineType);
    return container;
}

UIView *createSection(NSInteger height, NSArray *views, ESectionLineType lineType){
    return createContainer(APP_SCREEN_WIDTH, height, views, lineType);
}

UIButton *createImageButton(UIImage *normal, UIImage *highLighted){
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:normal forState:UIControlStateNormal];
    [button setImage:highLighted forState:UIControlStateHighlighted];
    button.size = normal.size;
    return button;
}

UIButton *createTextButton(NSString *text, UIFont *font, UIColor *normal, UIColor *highlighted){
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:normal forState:UIControlStateNormal];
    [button setTitleColor:highlighted forState:UIControlStateHighlighted];
    return button;
}


//------------------------------------------------------------------------------
void dmLayoutInParentX(UIView *view, UIView *parent, CGFloat left, CGFloat right){
    if (left == EAuto && right == EAuto) { //居中
        view.left = (parent.width - view.width)/2.0;
    }
    else if(right == EAuto){ //左对齐
        view.left = left;
    }
    else if(left == EAuto){ //右对齐
        view.right = parent.width - right;
    }
    else{ //左右对齐
        view.width = parent.width - left - right;
        view.left = left;
    }
}

void dmLayoutInParentY(UIView *view, UIView *parent, CGFloat top, CGFloat bottom){
    if (top == EAuto && bottom == EAuto) { //居中
        view.top = (parent.height - view.height)/2.0;
    }
    else if(bottom == EAuto){ //上对齐
        view.top = top;
    }
    else if(top == EAuto){ //下对齐
        view.bottom = parent.height - bottom;
    }
    else{ //上下对齐
        view.height = parent.height - top - bottom;
        view.top = top;
    }
}

void layoutInParent(UIView *view, CGFloat left, CGFloat right, CGFloat top, CGFloat bottom){
    dmLayoutInParentX(view, view.superview, left, right);
    dmLayoutInParentY(view, view.superview, top, bottom);
}

