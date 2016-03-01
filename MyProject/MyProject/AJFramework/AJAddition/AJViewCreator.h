//
//  AKAutoViewUtil.h
//  alijkManager
//
//  Created by liangqiang on 16/2/17.
//  Copyright © 2016年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kNull ([NSNull null])
#define isNull(v) ((!v) || ([v isEqual:[NSNull null]]))
#define isNotNull(v) ((v) && (![v isEqual:[NSNull null]]))

#define  ARGS_TO_PARAMS_ARRAY(first) \
            va_list args;\
            va_start(args, first);\
            NSMutableArray *params = [NSMutableArray array];\
            for (id obj=first; obj!=nil; obj = va_arg(args,NSObject*)) {\
                [params addObject:obj];\
            }\
            va_end(args);\

@interface AJViewCreator :NSObject
@end

@interface UIView (AKViewCreator)
// UIView: backgroundColor
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;

// cornerRadius, borderWidth, borderColor
-(void)setCornerRadiusWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;
@end

@interface UILabel (AKViewCreator)
// UILabel: font, textColor, text, textAlignment
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;
@end

@interface UIImageView (AKViewCreator)
// UIImageView: contentMode, image, highlightedImage
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;
@end

@interface UIButton (AKViewCreator)
// UIButton:  titleLabelFont, normalColor, normalTitle, cornerRadius
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;

// normalBgColor, highligtedBgColor, normalImage, highlightedImage
-(void)setBgColorWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;
@end

@interface UITextView (AKViewCreator)
// UITextView: font, textColor
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;
@end

@interface UITextField (AKViewCreator)
// UITextField: font, textColor
+(instancetype)newWith:(id)first, ... NS_REQUIRES_NIL_TERMINATION;
@end
