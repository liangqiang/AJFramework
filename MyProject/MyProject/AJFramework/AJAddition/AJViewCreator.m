//
//  AKAutoViewUtil.m
//  alijkManager
//
//  Created by liangqiang on 16/2/17.
//  Copyright © 2016年 SunX. All rights reserved.
//

#import "AJViewCreator.h"

@implementation AJViewCreator

@end

@implementation UIView (AKViewCreator)

// UIView: backgroundColor
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    UIColor *backgroundColor = [params safeObjectAtIndex:0];
    
    UIView *view = [UIView new];
    if([backgroundColor isKindOfClass:[UIColor class]]){
        view.backgroundColor = backgroundColor;
    }
    view.clipsToBounds = YES;
    
    return view;
}

@end

@implementation UILabel (AKViewCreator)

// UILabel: font, textColor, text, textAlignment
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    UIFont *font = [params safeObjectAtIndex:0];
    UIColor *textColor = [params safeObjectAtIndex:1];
    NSString *text = [params safeObjectAtIndex:2];
    NSNumber *textAlignment = [params safeObjectAtIndex:3];
    
    UILabel *label = [UILabel new];
    if([font isKindOfClass:[UIFont class]]){
        label.font = font;
    }
    if ([textColor isKindOfClass:[UIColor class]]){
        label.textColor = textColor;
    }
    if ([text isKindOfClass:[NSString class]]) {
        label.text = text;
    }
    if ([textAlignment isKindOfClass:[NSNumber class]]){
        label.textAlignment = [textAlignment integerValue];
    }
    label.clipsToBounds = YES;
    
    return label;
}

@end

@implementation UIImageView (AKViewCreator)

// UIImageView: contentMode, image, highlightedImage
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    NSNumber *contentMode = [params safeObjectAtIndex:0];
    UIImage *image = [params safeObjectAtIndex:1];
    UIImage *highlightedImage = [params safeObjectAtIndex:2];
    
    UIImageView *imageView = [UIImageView new];
    if ([contentMode isKindOfClass:[NSNumber class]]) {
        imageView.contentMode = [contentMode integerValue];
    }else{
        imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    if ([image isKindOfClass:[UIImage class]]) {
        imageView.image = image;
    }
    if ([highlightedImage isKindOfClass:[UIImage class]]) {
        imageView.highlightedImage = highlightedImage;
    }
    imageView.clipsToBounds = YES;
    
    return imageView;
}

@end

@implementation UIButton (AKViewCreator)

// UIButton: normalBgColor, hightligtedBgColor titleLabelFont, normalColor, normalTitle, cornerRadius
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    UIColor *normalBgColor = [params safeObjectAtIndex:0];
    UIColor *hightligtedBgColor = [params safeObjectAtIndex:1];
    UIFont *titleLabelFont = [params safeObjectAtIndex:2];
    UIColor *normalColor = [params safeObjectAtIndex:3];
    NSString *normalTitle = [params safeObjectAtIndex:4];
    NSNumber *cornerRadius = [params safeObjectAtIndex:5];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if ([normalBgColor isKindOfClass:[UIColor class]]) {
        UIImage *image = [AJUtil createImageWithColor:normalBgColor];
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }
    if ([hightligtedBgColor isKindOfClass:[UIColor class]]) {
        UIImage *image = [AJUtil createImageWithColor:hightligtedBgColor];
        [button setBackgroundImage:image forState:UIControlStateHighlighted];
    }
    if ([titleLabelFont isKindOfClass:[UIFont class]]) {
        button.titleLabel.font  = titleLabelFont;
    }
    if ([normalColor isKindOfClass:[UIColor class]]) {
        [button setTitleColor:normalColor forState:UIControlStateNormal];
    }
    if ([normalTitle isKindOfClass:[NSString class]]) {
        [button setTitle:normalTitle forState:UIControlStateNormal];
    }
    if ([cornerRadius isKindOfClass:[NSNumber class]]) {
        button.layer.cornerRadius = [cornerRadius floatValue];
    }
    button.clipsToBounds = YES;

    return button;
}

@end

@implementation UITextView (AKViewCreator)

// UITextView: font, textColor
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    UIFont *font = [params safeObjectAtIndex:0];
    UIColor *textColor = [params safeObjectAtIndex:1];
    
    UITextView *textView = [UITextView new];
    if([font isKindOfClass:[UIFont class]]){
        textView.font = font;
    }
    if ([textColor isKindOfClass:[UIColor class]]){
        textView.textColor = textColor;
    }
    textView.clipsToBounds = YES;
    
    return textView;
}

@end

@implementation UITextField (AKViewCreator)

// UITextField: font, textColor
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    UIFont *font = [params safeObjectAtIndex:0];
    UIColor *textColor = [params safeObjectAtIndex:1];
    
    UITextField *textView = [UITextField new];
    if([font isKindOfClass:[UIFont class]]){
        textView.font = font;
    }
    if ([textColor isKindOfClass:[UIColor class]]){
        textView.textColor = textColor;
    }
    textView.clipsToBounds = YES;
    
    return textView;
}

@end
