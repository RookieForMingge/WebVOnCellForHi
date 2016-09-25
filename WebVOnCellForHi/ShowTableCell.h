//
//  ShowTableCell.h
//  tigerhill-app-ios
//
//  Created by 孙庆庆 on 16/2/17.
//  Copyright © 2016年 孙庆庆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ShowTableCell : UITableViewCell

@property (nonatomic ,retain)UIWebView      *web_info;
@property (nonatomic ,retain)WKWebView      *wk_web;

@end
