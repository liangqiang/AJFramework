//
//  CNSettings.m
//  FamilyLove
//
//  Created by lizhao on 14-9-10.
//  Copyright (c) 2014年 lizhao. All rights reserved.
//

#import "AJSettings.h"

@interface AJSettings()
{
    NSString                    *_filePath;
    NSMutableDictionary         *_settingDictionary;
}
@end

@implementation AJSettings

#define KUserInfoPlist @"AKDragonUserInfo.plist"

+ (instancetype)sharedInstance {
    static AJSettings *sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        [self initFile:KUserInfoPlist];
    }
    return self;
}

-(void) initFile:(NSString*)path {
    // 如果Documents/NdDb/目录不存在则创建
    _filePath = [NSString stringWithFormat:@"%@/%@/%@", NSHomeDirectory(), @"Documents", path];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //文件不存在则创建文件
    if(![fileManager fileExistsAtPath:_filePath]) {
        _settingDictionary = [[NSMutableDictionary alloc] init];
        
        // 初始化设置项目
        [_settingDictionary setObject:@"0" forKey:K_MissCallCount];
        [_settingDictionary setObject:@"0" forKey:K_MissWXMsgCount];
        
        [_settingDictionary writeToFile:_filePath atomically:YES];
        
    }
    else {
        _settingDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:_filePath];
    }
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if (!value || [value isEqual:[NSNull null]]) value = @"";
    
    @synchronized (_settingDictionary) {
        [_settingDictionary setObject:value forKey:key];
        [_settingDictionary writeToFile:_filePath atomically:YES];
    }
}

- (id)valueForKey:(NSString *)key {
    @synchronized (_settingDictionary) {
        return [_settingDictionary objectForKey:key];
    }
}

- (NSString *) nullString:(id)value {
    if (value == nil) return @"";
    if (![value isKindOfClass:[NSString class]]) return @"";
    
    return value;
}

- (void)clearDefaults {
    @synchronized (self) {
        [_settingDictionary removeAllObjects];
        [_settingDictionary writeToFile:_filePath atomically:YES];
    }
}

@end
