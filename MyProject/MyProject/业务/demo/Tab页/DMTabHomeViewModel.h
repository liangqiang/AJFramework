//
//  DMTabHomeViewModel.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface DMTabHomeViewModel : AJViewModel

//AJTabHomeItem
@property (nonatomic, strong) NSMutableArray                     *tabs;

@end

@interface DMTabHomeItem : NSObject

@property (nonatomic, retain) NSString                    *title;
@property (nonatomic, retain) UIImage                     *imageNormal;
@property (nonatomic, retain) UIImage                     *imageSelected;
@property (nonatomic, retain) NSString                    *vcClass;
@property (nonatomic, retain) UIViewController            *controller;
@end
