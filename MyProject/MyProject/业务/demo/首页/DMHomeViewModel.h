//
//  DMHomeViewModel.h
//  MyProject
//
//  Created by liangqiang on 15/10/26.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "AJViewModel.h"

@interface DMHomeViewModel : AJViewModel

-(void)onSetNaviRootClicked;
-(void)onSetTabRootClicked;

-(void)onPushBlankClicked;
-(void)onLoadingClicked;
@end
