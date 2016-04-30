//
//  AJPickerView.m
//  MyProject
//
//  Created by liangqiang on 16/4/30.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJPickerView.h"

@implementation AJPickerView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.componentArray.count;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [[self.componentArray safeObjectAtIndex:component] count];
}

#pragma mark UIPickerViewDelegate
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *rowArray = [self.componentArray safeObjectAtIndex:component];
    NSString *rowItem = [rowArray safeObjectAtIndex:row];
    if ([rowItem isKindOfClass:[NSString class]]) {
        return rowItem;
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.selectBlock) {
        self.selectBlock(self, component, row);
    }
}

-(NSArray*)seletedRows{
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i=0; i < self.componentArray.count; i ++) {
        NSArray *rowArray = [self.componentArray safeObjectAtIndex:i];
        NSInteger rowSelected = [self selectedRowInComponent:i];
        [array addObject:[rowArray safeObjectAtIndex:rowSelected]];
    }
    return array;
}

@end
