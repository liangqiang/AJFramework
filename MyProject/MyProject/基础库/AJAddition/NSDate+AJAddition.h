//
//  NSDate+AJAddition.h
//  MyProject
//
//  Created by liangqiang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (AJAddition)

-(NSDate *)offsetMonth:(int)numMonths;
-(NSDate *)offsetDay:(int)numDays;
-(NSDate *)offsetHours:(int)hours;

@end
