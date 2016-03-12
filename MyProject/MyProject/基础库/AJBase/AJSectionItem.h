//
//  AJTableSection.h
//  MyProject
//
//  Created by liangqiang on 15/12/7.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJSectionItem : NSObject
@property (nonatomic,strong) id sectionInfo; //section的信息，如标题
@property (nonatomic,strong) NSMutableArray *cellDataArray;
@end
