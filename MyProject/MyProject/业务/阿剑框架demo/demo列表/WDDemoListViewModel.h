//
//  WDAJDemoListViewModel.h
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDDemoListViewModel : NSObject
@property (nonatomic,strong) NSMutableArray *sectionArray; //AJSectionItem

-(void)loadData;
-(void)onCellClicked:(NSIndexPath*)indexPath;

@end
