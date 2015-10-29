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

- (CGSize)sizeWithFont:(UIFont *)font fitWidth:(NSInteger)width;

@end
