//
//  AJPageDebugViewModel.m
//  alijkManager
//
//  Created by liangqiang on 15/9/10.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJPageDebugViewModel.h"

@implementation AJPageDebugViewModel

- (id)init {
    self = [super init];
    if (self) {
        self.buttons = [NSMutableArray array];
        [self initViewModel];
    }
    return self;
}

-(void)initViewModel{
    [self.buttons removeAllObjects];
    [self addButton:@[@"选择角色", @"AJChoiceRoleViewController"]];
    [self addButton:@[@"补充个人信息", @"AJFillUserInfoViewController"]];
    [self addButton:@[@"上传身份照片", @"AJUploadIDCardViewController"]];
    [self addButton:@[@"选择医生", @"AJChoiceDoctorViewController"]];
    [self addButton:@[@"协议", @"AJAgreementViewController"]];
    [self addButton:@[@"等待医生同意", @"AJWaitingViewController"]];
    [self addButton:@[@"拒绝申请", @"AJRefuseViewController"]];
    [self addButton:@[@"用户tab", @"AJFamilyTabViewController"]];
    
    [self refreshView];
}

-(void) addButton:(NSArray*)params{
    AJPageDebugButtonItem *item = [AJPageDebugButtonItem new];
    item.title = params[0];
    item.vcClass = params[1];
    [self.buttons addObject:item];
}

-(void)onExtraButtonClicked{
//    [TDDShowLoadingView showMsgHUD:@"加载中……" duration:5 touchClose:YES];
    [AJProgressHUD showLoadingHUD:@"加载中" duration:5];
}


@end

@implementation AJPageDebugButtonItem
@end