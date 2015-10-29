//
//  CNSettings.h
//  FamilyLove
//
//  Created by lizhao on 14-9-10.
//  Copyright (c) 2014年 lizhao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  首选项
 *
 */


#define K_US_AccessToken                @"K_US_AccessToken"
#define K_US_WebCookie                  @"K_US_WebCookie"
#define K_LastSelectedCity              @"K_LastSelectedCity"
#define K_MissCallCount                 @"K_MissCallCount"
#define K_MissWXMsgCount                @"K_MissWXMsgCount"
#define K_US_SearchHistory              @"K_US_SearchHistory"
//上传添加DoctorId
//#define K_US_DoctorId                   @"K_US_DoctorId"
//#define K_Test_Result                   @"K_Test_Result"
//#define K_CloudHospital_Banner          @"K_CloudHospital_Banner"
//#define K_US_ServiceId                  @"K_US_ServiceId"
//#define K_US_DiscoverPageHealthyIsShow  @"K_US_DiscoverPageHealthyIsShow"
//#define K_US_DiscoverPageExamIsShow     @"K_US_DiscoverPageExamIsShow"
//#define K_US_DiscoverPageAlarmIsShow    @"K_US_DiscoverPageAlarmIsShow"


@interface AJSettings : NSObject

+ (AJSettings*)sharedInstance;

- (void)setValue:(id)value forKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;
- (void)clearDefaults ;

- (NSString *) nullString:(id)value;

@end