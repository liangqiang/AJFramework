//
//  DMTabHomeViewModel.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface DMTabHomeViewModel : NSObject

//AJTabHomeItem
@property (nonatomic, strong) NSMutableArray                     *tabs;

-(void)loadAllTabs;
@end

@interface DMTabHomeItem : NSObject

@property (nonatomic, strong) NSString                    *title;
@property (nonatomic, strong) UIImage                     *imageNormal;
@property (nonatomic, strong) UIImage                     *imageSelected;
@property (nonatomic, strong) NSString                    *vcClass;
@property (nonatomic, strong) UIViewController            *controller;
@end
