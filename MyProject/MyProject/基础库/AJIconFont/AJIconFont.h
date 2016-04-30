//
//  AJIconFont.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJIconFont : NSObject

+ (UIImage *)iconWithFontName:(NSString*)fontName text:(NSString*)text size:(CGFloat)size color:(UIColor*)color;

@end

#define AJIconFontMake(fontName,fontText,fontSize,fontColor) [AJIconFont iconWithFontName:fontName text:fontText size:fontSize color:fontColor]
