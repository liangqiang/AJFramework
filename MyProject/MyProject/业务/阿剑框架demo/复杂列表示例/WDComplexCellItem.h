//
//  WDComplexCellItem.h
//  MyProject
//
//  Created by liangqiang on 16/3/2.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDComplexCellItem : NSObject
@property (nonatomic,assign) NSInteger cellType; //0 , 1
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@end
