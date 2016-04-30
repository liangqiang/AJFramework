//
//  AJPickerView.h
//  MyProject
//
//  Created by liangqiang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AJPickerViewSelectBlock)(id pickerView, NSInteger component, NSInteger row);

@interface AJPickerView : UIPickerView <UIPickerViewDataSource, UIPickerViewDelegate>

// 只针对简单文本的pickerView，为文本字符串数组
@property (nonatomic,strong) NSArray<NSArray*> *componentArray; // 二维数组

@property (nonatomic,copy) AJPickerViewSelectBlock selectBlock;
-(void)setSelectBlock:(AJPickerViewSelectBlock)selectBlock;

// 获取选择的行
-(NSArray*)seletedRows;

@end
