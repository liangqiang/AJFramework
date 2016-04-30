//
//  SXDatePickerView.h
//  TPO
//
//  Created by SunX on 14-5-16.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJDatePicker : UIView
@property (nonatomic,strong) UIDatePicker*          datePicker;

+(id)showWithChooseBlock:(AJStringBlock)chooseBlock cancelBlock:(AJVoidBlock)cancelBlock;

@end
