//
//  WDHomeViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/2/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDButtonItem.h"

@interface WDHomeViewModel : NSObject

@property (nonatomic,strong) NSMutableArray *buttonArray;

-(void)loadData;

@end
