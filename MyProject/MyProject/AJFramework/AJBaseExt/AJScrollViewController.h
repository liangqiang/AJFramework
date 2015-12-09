//
//  AJScrollViewController.h
//  alijkManager
//
//  Created by liangqiang on 15/9/6.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJViewController.h"
//#import "UIScrollView+AJAddition.h"

@interface AJScrollViewController : AJViewController

@property (nonatomic, weak) UIScrollView    *scrollView;

-(void)addKeyBoardObserver; // 监听键盘，解决键盘遮挡问题

@end
