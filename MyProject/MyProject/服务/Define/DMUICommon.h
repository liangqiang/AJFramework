//
//  DMUICommon.h
//  MyProject
//
//  Created by liangqiang on 15/11/4.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

//线条类型
typedef NS_OPTIONS(NSUInteger, ESectionLineType) {
    ELineNone = 0,
    ELineTop = 1 << 0,
    ELineTopShort = 1 << 1,
    ELineBottom = 1 << 2,
    ELineBottomShort = 1 << 3,
};

//UILabel
UILabel* createLabel(NSString *text, UIFont *font, UIColor *textColor);
UILabel* createLabelMulti(NSString *text, UIFont *font, UIColor *textColor, NSInteger width, NSInteger numberOfLines);

UIImageView *createImageView(UIImage *image, UIViewContentMode contentMode);

UIView *createContainer(NSInteger width, NSInteger height, NSArray *views, ESectionLineType lineType);
UIView *createSection(NSInteger height, NSArray *views, ESectionLineType lineType);


UIButton *createImageButton(UIImage *normal, UIImage *highLighted);
UIButton *createTextButton(NSString *text, UIFont *font, UIColor *normal, UIColor *highlighted);

//创建完控件后可以用以下方法控制
//更改大小：frame, size,
//更改位置： 1.frame, origin, center,
//         2.left, right, top, bottom
//         3.akPosInParent, akPosByBrother方法

#define POS_AUTO 999999999

//对父view进行相对布局
//如果left＝auto，right＝auto，则居中
//如果left＝XXX，right＝auto，则相对靠左
//如果left＝auto，right＝YYY，则相对靠右
//如果left＝XXX，right＝YYY，则靠左XXX、靠右YYY，宽度改变
//top和bottom是同理
void dmPosInParent(UIView *view, NSInteger left, NSInteger right, NSInteger top, NSInteger bottom);

//对兄弟view进行相对布局(有相同的parent)
void dmPosByBrother(UIView *view, UIView *brother, NSInteger left, NSInteger right, NSInteger top, NSInteger bottom);



