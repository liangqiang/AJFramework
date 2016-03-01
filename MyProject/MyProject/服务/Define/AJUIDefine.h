//
//  DMUIDefine.h
//  MyProject
//
//  Created by liangqiang on 15/10/29.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#ifndef MyProject_DMUIDefine_h
#define MyProject_DMUIDefine_h

// 绘画相关
#define kOnePixel (1 / [[UIScreen mainScreen] scale])

// UI相关颜色值
#define kWhiteColor             HEXCOLOR(0xffffff)
#define kLightGrayColor         HEXCOLOR(0xdddddd)
#define kGrayColor              HEXCOLOR(0x999999)
#define kLightBlackColor        HEXCOLOR(0x333333)
#define kBlackColor             HEXCOLOR(0x000000)
#define kRedColor               HEXCOLOR(0xff0000)

#define kMainBlueColor           HEXCOLOR(0x44c0da)


#define kNavBgColor             HEXCOLOR(0x46c2dc)
#define kNormalBgColor          HEXCOLOR(0xf0f0f6)
// 提醒红色
#define kAlertRedColor          HEXCOLOR(0xf43530)

// bootstrap样式
#define kPrimaryLightColor              HEXCOLOR(0x0088cc)
#define kPrimaryNormalColor              HEXCOLOR(0x0066cc)
#define kPrimaryDarkColor              HEXCOLOR(0x0044cc)

// UI相关字体
#define kFont10                 [UIFont systemFontOfSize:10]
#define kFont12                 [UIFont systemFontOfSize:12]
#define kFont14                 [UIFont systemFontOfSize:14]
#define kFont16                 [UIFont systemFontOfSize:16]
#define kFont18                 [UIFont systemFontOfSize:18]
#define kFont10B                 [UIFont boldSystemFontOfSize:10]
#define kFont12B                 [UIFont boldSystemFontOfSize:12]
#define kFont14B                 [UIFont boldSystemFontOfSize:14]
#define kFont16B                 [UIFont boldSystemFontOfSize:16]
#define kFont18B                 [UIFont boldSystemFontOfSize:18]


// 日期格式
#define kDateFormatShort           @"yyyy-MM-dd"
#define kDateFormatLong            @"yyyy-MM-dd HH:mm:ss"

#endif
