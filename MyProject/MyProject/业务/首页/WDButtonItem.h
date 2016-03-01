//
//  WDHomeButtonItem.h
//  MyProject
//
//  Created by liangqiang on 16/2/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDButtonItem : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) SEL selector;

+(instancetype)newWithTitle:(NSString*)title selector:(SEL)selector;
@end
