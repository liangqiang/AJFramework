//
//  AJIconFont.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJIconFont : NSObject

+ (UIFont *)fontWithSize: (CGFloat)size;
+ (void)setFontName:(NSString *)fontName;
+ (UIImage *)iconWithText:(NSString*)text size:(CGFloat)size color:(UIColor*)color;

@end

#define AJIconFontMake(text,fontSize,fontColor) [AJIconFont iconWithText:text size:fontSize color:fontColor]
