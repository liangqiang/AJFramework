//
//  AJNormalItem.h
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJNormalItem : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *actionType;  // 操作类型: SEL, PushVC
@property (nonatomic,strong) NSString *actionContent; // selector, vc name

-(void)pushViewController;
-(void)runSelectorWithTarget:(id)target;
-(void)doActionWithUserInfo:(id)userInfo;

+(NSMutableArray*)createArray:(NSArray*)itemArray withType:(NSString*)type;
@end
