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
// default 白
#define kDefaultColor               HEXCOLOR(0xffffff)
#define kDefaultFocusColor          HEXCOLOR(0xe6e6e6)
#define kDefaultBorderColor          HEXCOLOR(0xcccccc)
// primary 蓝
#define kPrimaryColor               HEXCOLOR(0x337ab7)
#define kPrimaryFocusColor          HEXCOLOR(0x286090)
#define kPrimaryBorderColor          HEXCOLOR(0x2e6da4)
// success 绿
#define kSuccessColor               HEXCOLOR(0x5cb85c)
#define kSuccessFocusColor          HEXCOLOR(0x449d44)
#define kSuccessBorderColor          HEXCOLOR(0x4cae4c)
// info 蓝
#define kInfoColor               HEXCOLOR(0x5bc0de)
#define kInfoFocusColor          HEXCOLOR(0x31b0d5)
#define kInfoBorderColor          HEXCOLOR(0x46b8da)
// warning 橙
#define kWarningColor               HEXCOLOR(0xf0ad4e)
#define kWarningFocusColor          HEXCOLOR(0xec971f)
#define kWarningBorderColor          HEXCOLOR(0xeea236)
// danger 红
#define kDangerColor               HEXCOLOR(0xd9534f)
#define kDangerFocusColor          HEXCOLOR(0xc9302c)
#define kDangerBorderColor          HEXCOLOR(0xd43f3a)

//#define kPrimaryLightColor              HEXCOLOR(0x0088cc)
//#define kPrimaryNormalColor              HEXCOLOR(0x0066cc)
//#define kPrimaryDarkColor              HEXCOLOR(0x0044cc)

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
