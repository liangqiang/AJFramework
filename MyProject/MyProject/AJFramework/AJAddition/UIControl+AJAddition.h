//
//  SXUIButtonAdditions.h
//  TPO
//
//  Created by SunX on 14-5-20.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIControlEventBlock)(UIControl* control);

@interface UIControl (AJAddition)

- (void)handleEvent:(UIControlEvents)aEvent withBlock:(UIControlEventBlock)eventBlock;

@end
