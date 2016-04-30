//
//  SXDatePickerView.m
//  TPO
//
//  Created by SunX on 14-5-16.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import "AJDatePicker.h"

@interface AJDatePicker ()

@property (nonatomic,strong) UIButton *bgView;

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *okButton;

@property (nonatomic,copy) AJStringBlock       chooseBlcok;
@property (nonatomic,copy) AJVoidBlock       cancelBlcok;

@end

@implementation AJDatePicker

+(id)showWithChooseBlock:(AJStringBlock)chooseBlock cancelBlock:(AJVoidBlock)cancelBlock{
    AJDatePicker *datePicker = [[AJDatePicker alloc] initWithFrame:[UIScreen mainScreen].bounds];
    datePicker.chooseBlcok = chooseBlock;
    datePicker.cancelBlcok = cancelBlock;
    
    [mainWindow() addSubview:datePicker];
    [datePicker showView];
    return datePicker;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    [self addSubviews:self.bgView, self.contentView, nil];
    
    [self.bgView layoutWithInsets:UIEdgeInsetsZero];
    [self.contentView layoutWithInsets:UIEdgeInsetsMake(self.height, EAuto, EAuto, EAuto)];
}

// 从下往上弹出
-(void)showView {
    [UIView animateWithDuration:0.25f animations:^{
        self.bgView.alpha = 0.5f;
        self.contentView.top = self.height-self.contentView.height;
    } completion:^(BOOL finished) {
        
    }];
}

// 从上向下收起
-(void)closeView {
    [UIView animateWithDuration:0.25f animations:^{
        self.bgView.alpha = 0.f;
        self.contentView.top = self.height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)leftBtnAction{
    if (self.cancelBlcok) {
        self.cancelBlcok();
    }
    [self closeView];
}

-(void)rightBtnAction
{
    if (self.chooseBlcok) {
        NSDate *selected = [self.datePicker date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (self.datePicker.datePickerMode == UIDatePickerModeTime) {
            [dateFormatter setDateFormat:@"HH:mm"];
        }else if (self.datePicker.datePickerMode == UIDatePickerModeDate){
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }else{
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        }
        self.chooseBlcok([dateFormatter stringFromDate:selected]);
    }
    [self closeView];
}

#pragma mark - Getter
-(UIButton*)bgView{
    if (!_bgView) {
        _bgView =  [UIButton new];
        _bgView.size = self.size;
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.f;
        [_bgView addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _bgView;
}

-(UIView*)contentView{
    if (!_contentView) {
        _contentView =  [UIView new];
        _contentView.size = CGSizeMake(self.width, 260);
        _contentView.backgroundColor = [UIColor whiteColor];
        
        [_contentView addLineWithY:0 color:kGrayColor];
        [_contentView addLineWithY:44 color:kGrayColor];
        
        [_contentView addSubviews:self.datePicker, self.cancelButton, self.okButton, nil];
        [self.datePicker layoutWithInsets:UIEdgeInsetsMake(44, EAuto, EAuto, EAuto)];
        [self.cancelButton layoutWithInsets:UIEdgeInsetsMake(9, 10, EAuto, EAuto)];
        [self.okButton layoutWithInsets:UIEdgeInsetsMake(9, EAuto, EAuto, 10)];
    }
    return _contentView;
}

-(UIDatePicker*)datePicker{
    if (!_datePicker) {
        _datePicker = [UIDatePicker new];
        _datePicker.size = CGSizeMake(self.width, 216);
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = UIDatePickerModeTime;
        [_datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"Chinese"]];
    }
    return _datePicker;
}

-(UIButton*)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [UIButton newWith:kFont14, HEXCOLOR(0x44c0da), @"取消", nil];
        _cancelButton.size = CGSizeMake(44, 26);
        [_cancelButton addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

-(UIButton*)okButton{
    if (!_okButton) {
        _okButton = [UIButton newWith:kFont14, HEXCOLOR(0x44c0da), @"保存", nil];
        _okButton.size = CGSizeMake(44, 26);
        [_okButton addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _okButton;
}


@end
