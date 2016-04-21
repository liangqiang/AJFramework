//
//  WDHomeViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/2/29.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDHomeViewModel : AJViewModel

@property (nonatomic,strong) NSMutableArray *itemArray; //AJNormalItem

-(void)loadData;
-(void)onItemClicked:(AJNormalItem*)item;

@end
