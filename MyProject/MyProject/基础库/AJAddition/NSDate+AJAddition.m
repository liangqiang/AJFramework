//
//  NSDate+AJAddition.m
//  MyProject
//
//  Created by liangqiang on 16/4/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "NSDate+AJAddition.h"

@implementation NSDate (AJAddition)

static BOOL g_monday_as_first = NO;

-(NSDate *)offsetMonth:(int)numMonths {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    g_monday_as_first ? [gregorian setFirstWeekday:2] : [gregorian setFirstWeekday:1];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

-(NSDate *)offsetDay:(int)numDays {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    g_monday_as_first ? [gregorian setFirstWeekday:2] : [gregorian setFirstWeekday:1];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

-(NSDate *)offsetHours:(int)hours {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    g_monday_as_first ? [gregorian setFirstWeekday:2] : [gregorian setFirstWeekday:1];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    //[offsetComponents setMonth:numMonths];
    [offsetComponents setHour:hours];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

@end
