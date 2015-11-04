//
//  AJViewController.h
//  alijkManager
//
//  Created by liangqiang on 15/8/31.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJViewController : AJViewControllerBase

@property (nonatomic,assign) BOOL   navigationBarHidden;

//创建界面，子类需重载，只调用一次
-(void)createViews;

//更新界面，子类需重载，每次refreshView，viewWillAppear时调用
-(void)updateViews;

@end