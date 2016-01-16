//
//  AJTableView.h
//  MyProject
//
//  Created by liangqiang on 16/1/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJTableView : UITableView <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSArray *sectionArray; // AJSectionItem
@property (nonatomic,copy) AJTableClickBlock clickBlock;
-(void)setClickBlock:(AJTableClickBlock)clickBlock;

-(id)cellData:(NSIndexPath*)indexPath;

@end
