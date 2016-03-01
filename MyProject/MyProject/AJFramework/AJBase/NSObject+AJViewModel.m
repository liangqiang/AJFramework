//
//  NSObject+AJViewModel.m
//  MyProject
//
//  Created by liangqiang on 16/1/14.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "NSObject+AJViewModel.h"

@implementation NSObject (AJViewModel)

-(void)setRefreshBlock:(AJRefreshBlock)refreshBlock{
    objc_setAssociatedObject(self, @selector(refreshBlock),
                             refreshBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(AJRefreshBlock)refreshBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)refresh{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

-(void)setHolder:(id)holder{
    objc_setAssociatedObject(self, @selector(holder),
                             holder,
                             OBJC_ASSOCIATION_ASSIGN);
}

-(id)holder{
    return objc_getAssociatedObject(self, _cmd);
}

-(id)createViewModel{
    NSObject *viewModel;
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        //property名称
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        if ([propertyName isEqualToString:@"viewModel"]) {
            //获取该property的数据类型
            const char* attries = property_getAttributes(property);
            NSString *attrString = [NSString stringWithUTF8String:attries];
            if ([attrString hasPrefix:@"T@"]) {
                NSString *className = [self parseClassNameFromAttrString:attrString];
                viewModel = [NSClassFromString(className) new];
                viewModel.holder = self;
            }
        }
    }
    NSAssert(viewModel, @"viewModel not created.");
    return viewModel;
}

-(NSString*)parseClassNameFromAttrString:(NSString*)attrString{
    NSRange startRange = [attrString rangeOfString:@"T@\""];
    NSRange endRange = [attrString rangeOfString:@"\","];
    NSRange nameRange = NSMakeRange(startRange.length, endRange.location-startRange.length);
    NSString *className = [attrString substringWithRange:nameRange];
    return className;
}

@end
