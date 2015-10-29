//
//  TDDUILabelAdditions.h
//  alijkManager
//
//  Created by liangqiang on 15/9/17.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UILabel (TDDUILabelAdditions)

//-(void)adjustsHeightToFitText; //根据文本内容调整大小

-(void)sizeToFitWidth;

- (NSArray *)getSeparatedLines;

@end
