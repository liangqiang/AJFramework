//
//  DMHomeTableViewCell.m
//  MyProject
//
//  Created by liangqiang on 16/1/15.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "DMHomeCell.h"

@implementation DMHomeCell

-(UIImageView*)leftImageView{
    if (_leftImageView==nil) {
        _leftImageView = [UIImageView newAutoLayoutView];
        _leftImageView.image = DMIconFontService;
        
        [self addSubview:_leftImageView];
        [_leftImageView autoSetDimensionsToSize:CGSizeMake(20, 20)];
        [_leftImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
        [_leftImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    }
    return _leftImageView;
}

-(UILabel*)titleLabel{
    if (_titleLabel==nil) {
        _titleLabel = [UILabel newAutoLayoutView];
        
        [self addSubview:_titleLabel];
        [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.leftImageView withOffset:15];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
        [_titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    }
    return _titleLabel;
}
@end
