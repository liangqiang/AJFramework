//
//  SXNSStringAdditions.m
//  TPO
//
//  Created by SunX on 14-5-9.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import "NSString+AJAddition.h"
#import <commoncrypto/CommonDigest.h>

@implementation NSString (AJAddition)

- (NSString *)MD5
{
    const char *str = [self UTF8String];
    unsigned char res[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str,(CC_LONG)strlen(str), res);
    NSMutableString *m = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [m appendFormat:@"%02x",res[i]];
    }
    return m;
}

- (CGSize)sizeWithFont:(UIFont *)font fitWidth:(NSInteger)width
{
    CGSize textSize;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    {
        NSStringDrawingOptions option = (NSStringDrawingTruncatesLastVisibleLine |
                                         NSStringDrawingUsesLineFragmentOrigin |
                                         NSStringDrawingUsesFontLeading);
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, 100000)
                                         options:option
                                      attributes:attributes
                                         context:nil];
        textSize = rect.size;
    }
#else
    {
        textSize = [self sizeWithFont:font constrainedToSize:size];
    }
#endif
    return textSize;
}


@end
