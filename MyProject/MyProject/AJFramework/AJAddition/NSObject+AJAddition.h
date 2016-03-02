//
//  SXNSObjectAdditions.h
//  TPO
//
//  Created by SunX on 14-5-14.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (AJAddition)

/**
 *  通过NSDictionary初始化property
 *  为什么要增加这个，目的是避免服务器数据类型错误的问题
 *  @param item
 */
- (void)safeSetProperty:(NSDictionary *)item;

/**
 *  重置所有property
 */
-(void)resetAllProperty;

/**
 *  获取当前class的property和value
 */
-(NSDictionary*)getAllProperties;
-(NSString*)findClassNameOfProperty:(NSString*)propertyName;


- (id)safeObjectFortKey:(NSString*)key;

- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSString*)jsonEncode;
- (id)jsonDecode;

//保存额外信息
@property (nonatomic,strong) id extraData;

@end

//------------------------------------------------------------------------------
/**
 *  数据校验
 */
NSString* safeString(id obj);
NSArray* safeArray(id obj);
NSDictionary* safeDictionary(id obj);
NSMutableArray* safeMutableArray(id obj);
NSMutableDictionary* safeMutableDictionary(id obj);

