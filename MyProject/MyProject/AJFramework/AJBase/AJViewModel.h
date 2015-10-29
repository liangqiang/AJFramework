//
//  AJViewModel.h
//  alijkManager
//
//  Created by liangqiang on 15/9/1.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AJViewModelRefreshBlock)();

@interface AJViewModel : NSObject

@property (nonatomic, copy) AJViewModelRefreshBlock             refreshBlock;

-(void) refreshView;

@end
