//
//  AJPageDebugViewModel.h
//  alijkManager
//
//  Created by liangqiang on 15/9/10.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJViewModel.h"

@interface AJPageDebugViewModel : AJViewModel

@property (nonatomic, strong) NSMutableArray       *buttons; //AJPageDebugButtonItem

-(void)onExtraButtonClicked;

@end

@interface AJPageDebugButtonItem : NSObject

@property (nonatomic, strong) NSString                     *title;
@property (nonatomic, strong) NSString                     *vcClass;

@end
