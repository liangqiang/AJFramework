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
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:normal forState:UIControlStateNormal];
    [button setTitleColor:highlighted forState:UIControlStateHighlighted];
    return button;
}


//------------------------------------------------------------------------------
void akPosInParentX(UIView *view, UIView *parent, NSInteger left, NSInteger right){
    if (left == POS_AUTO && right == POS_AUTO) { //居中
        view.left = (parent.width - view.width)/2;
    }
    else if(right == POS_AUTO){ //左对齐
        view.left = parent.left + left;
    }
    else if(left == POS_AUTO){ //右对齐
        view.right = parent.right - right;
    }
    else{ //左右对齐
        view.width = parent.width - left - right;
        view.left = parent.left + left;
    }
}

void akPosInParentY(UIView *view, UIView *parent, NSInteger top, NSInteger bottom){
    if (top == POS_AUTO && bottom == POS_AUTO) { //居中
        view.top = (parent.height - view.height)/2;
    }
    else if(bottom == POS_AUTO){ //上对齐
        view.top = parent.top + top;
    }
    else if(top == POS_AUTO){ //下对齐
        view.bottom = parent.bottom - bottom;
    }
    else{ //上下对齐
        view.height = parent.height - top - bottom;
        view.top = parent.top + top;
    }
}

void dmPosInParent(UIView *view, NSInteger left, NSInteger right, NSInteger top, NSInteger bottom){
    akPosInParentX(view, view.superview, left, right);
    akPosInParentY(view, view.superview, top, bottom);
}

void akPosByBrotherX(UIView *view, UIView *brother, NSInteger left, NSInteger right){
    if (left == POS_AUTO && right == POS_AUTO) { //居中
        view.left = brother.left + (brother.width - view.width)/2;
    }
    else if(right == POS_AUTO){ //左对齐
        view.right = brother.left - left;
    }
    else if(left == POS_AUTO){ //右对齐
        view.left = brother.right + right;
    }
    else{ //左右对齐
        view.width = brother.width + left + right;
        view.left = brother.left - left;
    }
}

void akPosByBrotherY(UIView *view, UIView *brother, NSInteger top, NSInteger bottom){
    if (top == POS_AUTO && bottom == POS_AUTO) { //居中
        view.top = brother.top + (brother.height - view.height)/2;
    }
    else if(bottom == POS_AUTO){ //上对齐
        view.bottom = brother.top - top;
    }
    else if(top == POS_AUTO){ //下对齐
        view.top = brother.bottom + bottom;
    }
    else{ //上下对齐
        view.height = brother.height + top + bottom;
        view.top = brother.top - top;
    }
}

void dmPosByBrother(UIView *view, UIView *brother, NSInteger left, NSInteger right, NSInteger top, NSInteger bottom){
    akPosByBrotherX(view, brother, left, right);
    akPosByBrotherY(view, brother, top, bottom);
}
