//
//  DMHomeTableViewCell.m
//  MyProject
//
//  Created by liangqiang on 16/1/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "DMHomeTableViewCell.h"

@implementation DMHomeTableViewCell

-(DMHomeButton*)mainButton{
    if (!_mainButton) {
        _mainButton = [DMHomeButton new];
        
        [self addSubview:_mainButton];
        [_mainButton autoPinEdgesToSuperviewEdges];
    }
    return _mainButton;
}
@end
