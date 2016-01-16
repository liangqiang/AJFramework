//
//  DMHomeViewModel.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMHomeCellItem.h"

@interface DMHomeViewModel : NSObject

@property (nonatomic,strong) NSMutableArray *sectionArray; //DMHomeButtonItem

-(void)loadTableData;
-(void)onCellClicked:(NSIndexPath*)indexPath;

@end
