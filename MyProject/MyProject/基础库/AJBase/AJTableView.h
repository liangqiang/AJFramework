//
//  AJTableView.h
//  MyProject
//
//  Created by liangqiang on 16/1/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AJTableClickBlock)(NSIndexPath *indexPath);

@interface AJTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray<AJSectionItem*> *sectionArray; // AJSectionItem

@property (nonatomic,copy) AJTableClickBlock clickBlock;
-(void)setClickBlock:(AJTableClickBlock)clickBlock;

-(id)cellItem:(NSIndexPath*)indexPath;

@end

@interface UITableViewCell (AJTableView)
-(void)updateWithItem:(id)cellItem;
@end