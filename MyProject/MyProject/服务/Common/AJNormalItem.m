//
//  AJNormalItem.m
//  MyProject
//
//  Created by liangqiang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "AJNormalItem.h"

@implementation AJNormalItem

-(void)pushViewController{
    if([self.actionType isEqualToString:@"PushVC"]){
        [AJNavi pushViewController:self.actionContent];
    }
}

-(void)runSelectorWithTarget:(id)target{
    if ([self.actionType isEqualToString:@"SEL"] && target) {
        [AJUtil performSelector:NSSelectorFromString(self.actionContent) onTarget:target];
    }
}

// 混合
-(void)doActionWithUserInfo:(id)userInfo{
    if ([self.actionType isEqualToString:@"SEL"] && userInfo) {
        [AJUtil performSelector:NSSelectorFromString(self.actionContent) onTarget:userInfo];
    }
    else if([self.actionType isEqualToString:@"PushVC"]){
        [AJNavi pushViewController:self.actionContent];
    }
}

+(NSMutableArray*)createArray:(NSArray*)itemArray withType:(NSString*)type{
    NSMutableArray *outputArray = [NSMutableArray array];
    for (NSArray *infos in itemArray) {
        AJNormalItem *cellItem = [AJNormalItem new];
        cellItem.title = [infos safeObjectAtIndex:0];
        if (type) {
            cellItem.actionType = type;
            cellItem.actionContent = [infos safeObjectAtIndex:1];
        }else{
            cellItem.actionType = [infos safeObjectAtIndex:1];
            cellItem.actionContent = [infos safeObjectAtIndex:2];
        }
        [outputArray addObject:cellItem];
    }
    return outputArray;
}

@end
