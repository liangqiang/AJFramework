//
//  AJTableViewController.m
//  alijkManager
//
//  Created by liangqiang on 15/9/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJTableViewController.h"

@interface AJTableViewController ()
@end

@implementation AJTableViewController

- (void)dealloc
{
//    [self.tableView removeObserver]; //否则KVO无法释放
    //Unregister notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UITableView*)tableView
{
    if(!_tableView)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        tableView.opaque  = YES;
        tableView.separatorStyle = NO;
        
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tableView.autoresizesSubviews = YES;
//        tableView.delegate = self ;
//        self.dataSource = [[AJChoiceDoctorDataSource alloc]initWithArray:self.viewModel.doctors];
//        tableView.dataSource = self.dataSource;
        tableView.userInteractionEnabled = YES;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    
    return _tableView;
}

-(void)createDataSource:(NSArray*)sectionArray{
    self.dataSource = [NSClassFromString([self dataSourceClassName]) new];
    self.dataSource.sectionArray = sectionArray;
//    self.dataSource.clickBlock = clickBlock;
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
}

//如子类的dataSource不符合命名规则，则需重载该函数
-(NSString*)dataSourceClassName{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
    if ([className hasSuffix:@"ViewController"]) {
        NSInteger index = className.length - @"ViewController".length;
        return [NSString stringWithFormat:@"%@%@", [className substringToIndex:index], @"DataSource"];
    }
    NSLog(@"Error：无法创建DataSourceClass");
    return nil;
}

@end
