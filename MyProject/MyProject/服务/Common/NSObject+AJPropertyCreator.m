//
//  NSObject+AJProperty.m
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "NSObject+AJPropertyCreator.h"

@implementation NSObject (AJPropertyCreator)
+(void)load{
}

-(id)createScrollView{
    NSString *className = [self findClassNameOfProperty:@"scrollView"];
    UIScrollView *scrollView = [NSClassFromString(className) new];
    NSAssert([scrollView isKindOfClass:[UIScrollView class]], @"scrollView not created.");
    
    scrollView.backgroundColor = kNormalBgColor;
    if ([self isKindOfClass:[UIViewController class]]) {
        scrollView.frame = ((UIViewController*)self).view.bounds;
    }
    scrollView.alwaysBounceVertical = YES;
    scrollView.autoresizingMask =  UIViewAutoresizingFlexibleHeight;
    return scrollView;
}

-(id)createTableView{
    NSString *className = [self findClassNameOfProperty:@"tableView"];
    UITableView *tableView = [NSClassFromString(className) new];
    NSAssert([tableView isKindOfClass:[UITableView class]], @"tableView not created.");
    
    tableView.backgroundColor = kNormalBgColor;
    if ([self isKindOfClass:[UIViewController class]]) {
        tableView.frame = ((UIViewController*)self).view.bounds;
    }
    tableView.autoresizingMask =  UIViewAutoresizingFlexibleHeight;
    return tableView;
}

-(id)createViewModel{
    NSString *className = [self findClassNameOfProperty:@"viewModel"];
    AJViewModel *viewModel = [NSClassFromString(className) new];
    NSAssert([viewModel isKindOfClass:[AJViewModel class]], @"viewModel not created.");
    viewModel.holder = self;
    return viewModel;
}

@end
