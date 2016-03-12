//
//  CNSettings.m
//  FamilyLove
//
//  Created by lizhao on 14-9-10.
//  Copyright (c) 2014年 lizhao. All rights reserved.
//

#import "AJSettings.h"

#define KSettingsFileName @"AJSettings.plist"

@interface AJSettings()
@property (nonatomic,strong) NSMutableDictionary*     settingsDict;
@end

@implementation AJSettings

+ (instancetype)sharedInstance {
    static AJSettings *sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(NSMutableDictionary*)settingsDict{
    if (!_settingsDict) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = [self filePath];
        if(![fileManager fileExistsAtPath:filePath]) {
            [self removeAllKeys]; //创建默认字典
        }else{
           _settingsDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        }
    }
    return _settingsDict;
}

-(NSString*)filePath{
    return [NSString stringWithFormat:@"%@/%@/%@", NSHomeDirectory(), @"Documents", KSettingsFileName];
}

- (void)setObject:(id)value forKey:(NSString *)key {
    if (!value || [value isEqual:[NSNull null]]) value = @"";
    
    @synchronized (self.settingsDict) {
        [self.settingsDict setObject:value forKey:key];
        [self.settingsDict writeToFile:[self filePath] atomically:YES];
    }
}

- (id)objectForKey:(NSString *)key {
    @synchronized (self.settingsDict) {
        return [self.settingsDict objectForKey:key];
    }
}

- (void)removeAllKeys {
    @synchronized (self) {
//        [_settingsDict removeAllObjects];
        self.settingsDict = [NSMutableDictionary dictionaryWithDictionary:self.defaultDict];
        [self.settingsDict writeToFile:[self filePath] atomically:YES];
    }
}

+ (void)setObject:(id)value forKey:(NSString *)key{
    return [[AJSettings sharedInstance]setObject:value forKey:key];
}
+ (id)objectForKey:(NSString *)key{
    return [[AJSettings sharedInstance]objectForKey:key];
}
+ (void)removeAllKeys{
    return [[AJSettings sharedInstance]removeAllKeys];
}


@end
