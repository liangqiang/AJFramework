//
//  AJTabViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/9.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJTabBarViewController.h"
#import "AJViewModel.h"

@interface AJTabBarViewController ()
@property (nonatomic,strong) AJViewModel *viewModel;
@property (nonatomic,assign) BOOL   viewsCreated;
@end

@implementation AJTabBarViewController

- (void)dealloc {
    NSLog(@"dealloc %@", self.description);
}

- (id)init {
    self = [super init];
    if (self) {
        self.navigationBarHidden = YES; //默认隐藏
        self.viewsCreated = NO;
    }
    return self;
}

-(id)initWithParams:(NSDictionary*)params{
    if (self = [self init]) {
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
    if (!self.viewsCreated) {
        [self createViews];
        self.viewsCreated = YES;
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
        __weak typeof(self) weakSelf = self;
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
