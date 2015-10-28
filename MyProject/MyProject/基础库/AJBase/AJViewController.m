//
//  AJViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/8/31.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJViewController.h"
#import "AJViewModel.h"

@interface AJViewController ()
@property (nonatomic,strong) AJViewModel *viewModel;
@property (nonatomic,assign) BOOL   isViewsCreated;
@end

@implementation AJViewController

- (void)dealloc {
    NSLog(@"dealloc %@", self.description);
}

- (id)init {
    self = [super init];
    if (self) {
        _navigationBarHidden = NO; //默认不隐藏
        _isViewsCreated = NO;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO; // 设置不透明，否则可能会引起scrollView的高度异常
    self.navigationController.navigationBarHidden = self.navigationBarHidden;
 
    [self refreshByViewModel];
}

-(void)refreshByViewModel{
    if (!self.isViewsCreated) {
        [self createViews];
        self.isViewsCreated = YES;
    }
    [self updateViews];
}

//创建界面，子类需重载，只调用一次
-(void)createViews{
}

//更新界面，子类需重载，每次refreshView，viewWillAppear时调用
-(void)updateViews{
}


-(AJViewModel*)viewModel{
    if (!_viewModel) {
        _viewModel = [NSClassFromString([self viewModelClassName]) new];
        
        //初始化viewModel，并设置refreshBlock
        WEAKSELF
        [_viewModel setRefreshBlock:^(){
            [weakSelf refreshByViewModel];
        }];
    }
    return _viewModel;
}

//如子类的viewModel不符合命名规则，则需重载该函数
-(NSString*)viewModelClassName{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
    if ([className hasSuffix:@"ViewController"]) {
        NSInteger index = className.length - @"ViewController".length;
        return [NSString stringWithFormat:@"%@%@", [className substringToIndex:index], @"ViewModel"];
    }
    NSLog(@"Error：无法创建viewModelClass");
    return nil;
}





@end
