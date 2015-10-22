//
//  AJDefine.h
//  MyProject
//
//  Created by liangqiang on 15/10/22.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#ifndef MyProject_AJDefine_h
#define MyProject_AJDefine_h

#import "AJColorManager.h"

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

//-----------------------------------  设备的宽高  ------------------------------------
#define APP_SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define APP_SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define LINE_HEIGHT     (1 / [[UIScreen mainScreen] scale])

//-----------------------------------  颜色  ------------------------------------
// e.g. HEXCOLOR(0xCECECE);
#define HEXCOLOR(rgbValue)  [AJColorManager colorWithHex:rgbValue alpha:1.f]

// e.g. HEXCOLORA(0xCECECE, 0.8);
#define HEXCOLORA(rgbValue,a) [AJColorManager colorWithHex:rgbValue alpha:a]


#endif
