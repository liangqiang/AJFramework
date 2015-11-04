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
UILabel* createLabel(CGRect frame, NSString *text, UIFont *font, UIColor *textColor);

UIImageView *createImageView(CGRect frame, UIImage *image, UIViewContentMode contentMode);

UIView *createContainer(NSInteger height, NSArray *views, ESectionLineType lineType);
