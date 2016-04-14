//
//  NSObject+AJProperty.h
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AJPropertyCreator)

-(id)createViewModel;
-(id)createScrollView;
-(id)createTableView;

@end
