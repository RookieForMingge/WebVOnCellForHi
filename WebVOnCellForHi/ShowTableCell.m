//
//  ShowTableCell.m
//  tigerhill-app-ios
//
//  Created by 孙庆庆 on 16/2/17.
//  Copyright © 2016年 孙庆庆. All rights reserved.
//

#import "ShowTableCell.h"
#import "Masonry.h"

@implementation ShowTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.web_info = [[UIWebView alloc]init];//WithFrame:self.frame];
        self.web_info.backgroundColor = [UIColor redColor];
        self.web_info.scrollView.pagingEnabled = NO;
        self.web_info.scrollView.bounces = NO;
        self.web_info.scrollView.scrollEnabled = NO;
        //勿加此句话
//        self.web_info.scalesPageToFit = YES;
        [self addSubview:self.web_info];
        [self.web_info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
