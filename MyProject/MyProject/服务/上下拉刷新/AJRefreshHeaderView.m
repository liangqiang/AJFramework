//
//  TDDRefreshHeaderView.m
//  TestScrollView
//
//  Created by SunX on 15/7/14.
//  Copyright (c) 2015年 SunX. All rights reserved.
//

#import "AJRefreshHeaderView.h"

@interface AJRefreshHeaderView ()

@property (nonatomic, strong) UIActivityIndicatorView*           loadingView;
@property (nonatomic, strong) UILabel*  hintLabel;
@end

@implementation AJRefreshHeaderView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.isHeader = YES;
    }
    return self;
}

-(void)updateViewWithStatus:(EStatusRefreshView)status{
    switch (status) {
        case EStatusRefreshViewPartVisible:
            self.hintLabel.text = @"下拉刷新";
            break;
            
        case EStatusRefreshViewAllVisible:
            self.hintLabel.text = @"释放刷新";
            break;
            
        case EStatusRefreshViewRefreshing:
            self.hintLabel.text = @"加载中…";
            break;
            
        default:
            break;
    }
    [self.loadingView startAnimating];
}

- (UIActivityIndicatorView*)loadingView {
    if (!_loadingView) {
        _loadingView = [[UIActivityIndicatorView alloc] init];
        [_loadingView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:_loadingView];
        _loadingView.frame = CGRectMake((self.frame.size.width-_loadingView.frame.size.width)/2-30,
                                                      (self.frame.size.height-_loadingView.frame.size.height)/2,
                                                      _loadingView.frame.size.width,
                                                      _loadingView.frame.size.height);
    }
    return _loadingView;
}

-(UILabel*)hintLabel{
    if(!_hintLabel){
        CGRect rect = CGRectMake(0, 0, 60, self.height);
        _hintLabel = [[UILabel alloc] initWithFrame:rect];
        _hintLabel.textColor = [UIColor grayColor];
        _hintLabel.font = [UIFont systemFontOfSize:14];
        _hintLabel.left = self.loadingView.right;
        [self addSubview:_hintLabel];
    }
    return _hintLabel;
}

@end
