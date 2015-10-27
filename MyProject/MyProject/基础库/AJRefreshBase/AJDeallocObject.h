//
//  AJDeallocObject.h
//  MyProject
//
//  Created by liangqiang on 15/10/27.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AJDeallocBlock)();

@interface AJDeallocObject : NSObject
@property (nonatomic,copy) AJDeallocBlock deallocBlock;

-(void)setDeallocBlock:(AJDeallocBlock)refreshBlock;

@end

@interface NSObject (AJDeallocObject)
-(void)bindDeallocBlock:(AJDeallocBlock)deallocBlock;
@end