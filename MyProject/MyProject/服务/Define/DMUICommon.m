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
UILabel* createLabel(CGRect frame, NSString *text, UIFont *font, UIColor *textColor){
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    return label;
}

UIImageView *createImageView(CGRect frame, UIImage *image, UIViewContentMode contentMode){
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    [imageView setImage:image];
    imageView.contentMode = contentMode;
    imageView.clipsToBounds = true;
    return imageView;
}

UIView *createContainer(NSInteger height, NSArray *views, ESectionLineType lineType){
    CGRect rect = CGRectMake(0, 0, APP_SCREEN_WIDTH, height);
    UIView *container = [[UIView alloc]initWithFrame:rect];
    container.backgroundColor = [UIColor whiteColor];
    for (UIView* view in views) {
        [container addSubview:view];
    }
    addContainerLines(container, lineType);
    return container;
}

