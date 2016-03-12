//
//  SXNSStringAdditions.h
//  TPO
//
//  Created by SunX on 14-5-9.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AJAddition)

//当前string的md5
- (NSString *)MD5;

// 返回不超过指定长度的字符串
-(NSString*)limitToLength:(NSInteger)length;

// 返回删除了emoji的字符串
-(NSString *)clearEmoji;

// 返回带有指定行间距的NSAttributedString
// 用法：label.attributedText = [content stringWithLineSpacing:4];
-(NSAttributedString*)stringWithLineSpacing:(CGFloat)lineSpacing;

// 计算字符串显示区域大小
- (CGSize)sizeWithFont:(UIFont *)font;
- (CGSize)sizeWithFont:(UIFont *)font fitWidth:(NSInteger)width;
-(CGSize)sizeWithFont:(UIFont *)font fitWidth:(NSInteger)width lineSpacing:(CGFloat)spacing;

@end
