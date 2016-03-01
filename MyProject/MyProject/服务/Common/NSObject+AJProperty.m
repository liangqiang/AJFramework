//
//  NSObject+AJProperty.m
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "NSObject+AJProperty.h"

@implementation NSObject (AJProperty)
+(void)load{
}

-(UIScrollView*)createScrollView{
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
    NSObject *viewModel = [NSClassFromString(className) new];
    NSAssert(viewModel, @"viewModel not created.");
    viewModel.holder = self;
    return viewModel;
}

-(NSString*)findClassNameOfProperty:(NSString*)propertyName{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++){
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        //property名称
        NSString *name = [NSString stringWithUTF8String:char_f];
        if ([name isEqualToString:propertyName]) {
            //获取该property的数据类型
            const char* attries = property_getAttributes(property);
            NSString *attrString = [NSString stringWithUTF8String:attries];
            if ([attrString hasPrefix:@"T@"]) {
                return [self parseClassNameFromAttrString:attrString];
            }
        }
    }
    return nil;
}

-(NSString*)parseClassNameFromAttrString:(NSString*)attrString{
    NSRange startRange = [attrString rangeOfString:@"T@\""];
    NSRange endRange = [attrString rangeOfString:@"\","];
    NSRange nameRange = NSMakeRange(startRange.length, endRange.location-startRange.length);
    NSString *className = [attrString substringWithRange:nameRange];
    return className;
}

@end
