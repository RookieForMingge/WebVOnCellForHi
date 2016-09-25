//
//  ViewController.m
//  WebVOnCellForHi
//
//  Created by 1 on 16/9/25.
//  Copyright © 2016年 1. All rights reserved.
//

#import "ViewController.h"
#import "ShowTableCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIWebViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIWebView           *v_webView;
    UITableView         *table_data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

- (void)setUI
{
    [self loadWeb];
    [self loadTable];
}

- (void)loadWeb
{
    v_webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    v_webView.delegate = self;
    v_webView.scrollView.scrollEnabled = NO;
    v_webView.scrollView.pagingEnabled = NO;
    v_webView.scrollView.bounces = NO;
    v_webView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    v_webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    //预先加载url
    [v_webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]]];
}

- (void)loadTable
{
    table_data = [[UITableView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight) style:UITableViewStyleGrouped];
    table_data.delegate = self;
    table_data.dataSource = self;
    table_data.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table_data];
    [table_data registerClass:[ShowTableCell class] forCellReuseIdentifier:@"ShowTableCell"];
}

#pragma mark - TableViewDelegate & TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        static NSString *identifier = @"ShowTableCell";
        ShowTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            cell = [[ShowTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            /* 忽略点击效果 */
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
        [cell.web_info loadRequest:request];
        return cell;
    }else{
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"cell====%ld",(long)indexPath.row];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if(indexPath.row == 0){
        /* 通过webview代理获取到内容高度后,将内容高度设置为cell的高 */
        return v_webView.frame.size.height;
    }else{
        return 40;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIWebView Delegate Methods
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //获取到webview的高度
    CGFloat height = [[v_webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    v_webView.frame = CGRectMake(v_webView.frame.origin.x,v_webView.frame.origin.y, kScreenWidth, height);
    [table_data reloadData];
}

@end
