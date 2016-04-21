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

// cornerRadius, borderWidth, borderColor
-(void)setCornerRadiusWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    NSNumber *cornerRadius = [params safeObjectAtIndex:0];
    NSNumber *borderWidth = [params safeObjectAtIndex:1];
    UIColor *borderColor = [params safeObjectAtIndex:2];
    
    if([cornerRadius isKindOfClass:[NSNumber class]]){
        self.layer.cornerRadius = [cornerRadius floatValue];
    }
    if([borderWidth isKindOfClass:[NSNumber class]]){
        self.layer.borderWidth = [borderWidth floatValue];
    }
    if([borderColor isKindOfClass:[UIColor class]]){
        self.layer.borderColor = borderColor.CGColor;
    }
    self.clipsToBounds = YES;
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

// UIButton:  titleLabelFont, normalColor, normalTitle, cornerRadius
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    UIFont *titleLabelFont = [params safeObjectAtIndex:0];
    UIColor *normalColor = [params safeObjectAtIndex:1];
    NSString *normalTitle = [params safeObjectAtIndex:2];
    NSNumber *cornerRadius = [params safeObjectAtIndex:3];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
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

// normalBgColor, highligtedBgColor, normalImage, highlightedImage
-(void)setBgColorWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION{
    ARGS_TO_PARAMS_ARRAY(first)
    UIColor *normalBgColor = [params safeObjectAtIndex:0];
    UIColor *highligtedBgColor = [params safeObjectAtIndex:1];
    UIImage *normalImage = [params safeObjectAtIndex:2];
    UIImage *highlightedImage = [params safeObjectAtIndex:3];

    if ([normalBgColor isKindOfClass:[UIColor class]]) {
        UIImage *image = [UIImage newWithColor:normalBgColor];
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    if ([highligtedBgColor isKindOfClass:[UIColor class]]) {
        UIImage *image = [UIImage newWithColor:highligtedBgColor];
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
    }
    if ([normalImage isKindOfClass:[UIImage class]]){
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    if ([highlightedImage isKindOfClass:[UIImage class]]){
        [self setImage:highlightedImage forState:UIControlStateHighlighted];
    }
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
