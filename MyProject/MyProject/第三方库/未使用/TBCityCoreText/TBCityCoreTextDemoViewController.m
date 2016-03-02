//
//  RootViewController.m
//  CoreText
//
//  Created by SunX on 14-4-9.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import "TBCityCoreTextDemoViewController.h"
#import "TBCityCoreTextLabel.h"
#include <sys/time.h>
#include <time.h>

@interface TBCityCoreTextDemoViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView*               tableView;
@property (nonatomic,strong) NSMutableArray*            datasArray;

@end

@implementation TBCityCoreTextDemoViewController

- (void)dealloc {
    NSLog(@"dealloc");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"CoreText 使用Demo";
    
    self.datasArray = [NSMutableArray array];
    
    [self.datasArray addObject:@"普通文本"];
    
    [self.datasArray addObject:@"<a color=\"red\">带字体颜色的文本</a>"];
    
    [self.datasArray addObject:@"带字体颜色和背带字体颜色和背<a color=\"orange\" bgColor=\"0x333333\">带字体颜色和背</a>景色的文本"];
    
    [self.datasArray addObject:@"<a fontSize=\"30\" color=\"blue\">带字体大小的文本</a>"];
    
    [self.datasArray addObject:@"<u unlineColor=\"blue\" fontSize=\"20\">带下划线的文本</u>"];
    
    [self.datasArray addObject:@"<i fontSize=\"14\">abcd  斜体，很奇怪，这里的斜体不支持中文</i>"];
    
    [self.datasArray addObject:@"<b fontSize=\"20\">粗体文本</b>"];
    
    [self.datasArray addObject:@"<a href=\"点击内容\" color='#0000ff'>可以点击的</a> 这里不可以点击"];
    
    [self.datasArray addObject:@"复杂的界面 ：<img src=\"bundle://LLDianTag@2x.png\" width=\"32\" height=\"32\"/> 男：<a color=\"red\" fontSize=\"12\" font=\"EuphemiaUCAS-Bold\">10</a>  <img src=\"bundle://LLDianTag@2x.png\" width=\"16\" height=\"16\"/> 女：<a color=\"orange\" fontSize=\"12\" font=\"GeezaPro-Light\">1000</a>"];
    
    [self.datasArray addObject:@"<a maxWidth=\"18\" fontSize=\"14\">这里控制输出文字数量这里控制输出文字数量,123456789011121314这里控制输出文字数量</a> <img src=\"bundle://LLDianTag@2x.png\" width=\"16\" height=\"16\"/>"];

    [self.datasArray addObject:@"网络图片 注意图片的高度不能高度label的高度 否则会显示不了<img src=\"http://gtms04.alicdn.com/tps/i4/T1mZRiFQldXXaG4.rS-300-300.png\" width=\"10\" height=\"10\"/>"];
    
    [self.datasArray addObject:@"这里是删除线：<a color=\"red\" maxWidth=\"4\">￥106666768</a><i color=\"gray\" midLineWidth=\"1\" midLineColor=\"#dddddd\" maxWidth=\"4\" fontSize=\"12\">￥106666768</i>"];
    
    [self.datasArray addObject:[NSString stringWithFormat:@"<a color=\"red\">%@</a>",[@"特殊xml字符需要过滤 例如 & <a>这些标签" xmlEscapeString]]];
    
    [self.datasArray addObject:@""];
    
    [self.datasArray addObject:@"1111"];
    
    self.tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0, 0,
                                                                    self.view.frame.size.width , self.view.frame.size.height)
                                                   style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 500)];

    
    NSString *text = @"TBCityCoreTextParser实现 ：<img src=\"bundle://LLDianTag@2x.png\" width=\"16\" height=\"16\"/> 男：<a color=\"red\" fontSize=\"12\" font=\"EuphemiaUCAS-Bold\">10</a>  <img src=\"bundle://LLDianTag@2x.png\" width=\"16\" height=\"16\"/> 女：<a color=\"orange\" fontSize=\"12\" font=\"GeezaPro-Light\" charSpace='10'>1000</a>";
    //需要提高性能，可以采用这个方式，保持TBCityCoreTextParser对象
    TBCityCoreTextParser *a = [TBCityCoreTextParser new];
    a.textAlign = kCTTextAlignmentCenter;
    [a buildAttributedString:text];
    TBCityCoreTextLabel *label = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(20, 10, 160, 100)];
    label.backgroundColor = [UIColor clearColor];
    [self.tableView.tableFooterView addSubview:label];
    [label attributedStringWithParser:a];
    
    //其他使用方式，全局textColor和font
    TBCityCoreTextLabel *label1 = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 100)];
    label1.textColor = [UIColor redColor];
    label1.font = [UIFont systemFontOfSize:18.f];
    [self.tableView.tableFooterView addSubview:label1];
    label1.text = text;
    
    TBCityCoreTextLabel *label2 = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(20, 200, 180, 100)];
    label2.textAlign = kCTTextAlignmentRight;
    label2.lineSpace = 10.f;
    [self.tableView.tableFooterView addSubview:label2];
    label2.text = text;
}

#pragma mark - UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indetify = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetify];
        cell.clipsToBounds = YES;
        cell.backgroundColor = [UIColor clearColor];
        //无行距
        TBCityCoreTextLabel *a = [[TBCityCoreTextLabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20,60)
                                                         withHandle:^(NSString *href, TBCityCoreTextLabel *label)
        {
            if (href) {
                UIAlertView *alert =  [[UIAlertView alloc] initWithTitle:@"你点击了CoreText"
                                                                 message:href
                                                                delegate:nil
                                                       cancelButtonTitle:@"确定"
                                                       otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
        a.tag = 111;
        //这里可以设置默认的字体
        a.font = [UIFont boldSystemFontOfSize:16.f];
        a.textColor = [UIColor blackColor];
        a.fixToCenterY = YES;   //自动居中
        [cell.contentView addSubview:a];
    }
    TBCityCoreTextLabel *a = (TBCityCoreTextLabel*)[cell viewWithTag:111];
    
    a.text = self.datasArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(long long)getMicroTime
{
    struct timeval tvStart;
    gettimeofday (&tvStart,NULL);
    long long tStart = (long long)1000000*tvStart.tv_sec+tvStart.tv_usec;
    return tStart;
}

@end
