//
//  AJScrollViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/6.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJScrollViewController.h"

@interface AJScrollViewController ()

@end

@implementation AJScrollViewController

- (void)dealloc
{
    //Unregister notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(AJScrollView*)scrollView{
    if (!_scrollView) {
        AJScrollView *scrollView = [[AJScrollView alloc] initWithFrame:self.view.bounds];
        scrollView.showsVerticalScrollIndicator = YES;
        scrollView.backgroundColor = HEXCOLOR(0xF5F5F5); // 背景为灰色
        scrollView.alwaysBounceVertical = YES;
        scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        [self.view addSubview:scrollView];
        _scrollView = scrollView;
    }
    
    return _scrollView;
}

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    self.scrollView.frame = self.view.bounds;
//}

-(void)addKeyBoardObserver{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) keyboardWillAppear:(NSNotification*)notification{
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardBounds;
    [keyboardBoundsValue getValue:&keyboardBounds];
    UIEdgeInsets e = UIEdgeInsetsMake(0, 0, keyboardBounds.size.height, 0);
    [self.scrollView setScrollIndicatorInsets:e];
    [self.scrollView setContentInset:e];
}

- (void) keyboardWillDisappear:(NSNotification*)notification{
    NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardBounds;
    [keyboardBoundsValue getValue:&keyboardBounds];
    UIEdgeInsets e = UIEdgeInsetsMake(0, 0, keyboardBounds.size.height, 0);
    [self.scrollView setScrollIndicatorInsets:e];
    [self.scrollView setContentInset:e];
    self.scrollView.contentOffset = CGPointMake(0, 0);
}
@end
