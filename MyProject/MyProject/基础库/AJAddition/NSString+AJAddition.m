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

-(NSString*)limitToLength:(NSInteger)length{
    if (self.length <= length) {
        return self;
    }
    
    NSMutableString *newStr = [NSMutableString string];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                              if (newStr.length + substring.length <= length) {
                                  [newStr appendString:substring];
                              }
                          }];
    
    return newStr;
}

-(NSString *)clearEmoji{
    NSMutableString *newStr = [NSMutableString string];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                              if (![NSString isEmoji:substring]) {
                                  [newStr appendString:substring];
                              }
                          }];
    
    return newStr;
}

+(BOOL) isEmoji:(NSString*)substring{
    const unichar hs = [substring characterAtIndex:0];
    if (0xd800 <= hs && hs <= 0xdbff) {
        if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
            if (0x1d000 <= uc && uc <= 0x1f77f) {
                return YES;
            }
        }
    } else if (substring.length > 1) {
        const unichar ls = [substring characterAtIndex:1];
        if (ls == 0x20e3 || ls == 0xfe0f || ls == 0xd83c) {
            return YES;
        }
    } else {
        if (0x2100 <= hs && hs <= 0x27ff) {
            return YES;
        } else if (0x2B05 <= hs && hs <= 0x2b07) {
            return YES;
        } else if (0x2934 <= hs && hs <= 0x2935) {
            return YES;
        } else if (0x3297 <= hs && hs <= 0x3299) {
            return YES;
        } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
            return YES;
        }
    }
    return NO;
}

-(NSAttributedString*)stringWithLineSpacing:(CGFloat)lineSpacing{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
    [paragraphStyle setParagraphSpacing:0];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}

- (CGSize)sizeWithFont:(UIFont *)font{
    return [self sizeWithFont:font fitWidth:NSIntegerMax];
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
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
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

-(CGSize)sizeWithFont:(UIFont *)font fitWidth:(NSInteger)width lineSpacing:(CGFloat)spacing{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];//调整行间距
    [paragraphStyle setParagraphSpacing:0];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    
    //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（注：字体大小+行间距=行高）
    NSStringDrawingOptions option = (NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
    
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:option context:nil];
    
    return rect.size;
}




@end
