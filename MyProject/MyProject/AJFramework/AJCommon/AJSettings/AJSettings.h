//
//  CNSettings.h
//  FamilyLove
//
//  Created by lizhao on 14-9-10.
//  Copyright (c) 2014年 lizhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJSettings : NSObject
@property (nonatomic,strong) NSDictionary      *defaultDict;

+ (AJSettings*)sharedInstance;

+ (void)setObject:(id)value forKey:(NSString *)key;
+ (id)objectForKey:(NSString *)key;
+ (void)removeAllKeys ;

@end