//
//  TDDUILabelAdditions.m
//  alijkManager
//
//  Created by liangqiang on 15/9/17.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "UILabel+AJAddition.h"
#import <CoreText/CoreText.h>
#import "NSString+AJAddition.h"

@implementation UILabel (TDDUILabelAdditions)

//-(void)adjustsHeightToFitText{
//    CGSize size = [TDDCommon sizeOfText:self.text withFont:self.font inSize:CGSizeMake(self.width, 100000)];
//    self.height = size.height;
//}

-(void)sizeToFitWidth{
    self.size = [self.text sizeWithFont:self.font fitWidth:self.width];
}

- (NSArray *)getSeparatedLines
{
    NSString *text = [self text];
    UIFont   *font = [self font];
    CGRect    rect = [self frame];
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    CFRelease(frame);
    CFRelease(path);
    CFRelease(frameSetter);
    CFRelease(myFont);

    return (NSArray *)linesArray;
}

@end
