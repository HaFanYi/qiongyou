//
//  NowGoView.m
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/16.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "NowGoView.h"

@implementation NowGoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.goView = [[UIImageView alloc]init];
        [self addSubview:self.goView];
        [self.goView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        self.goView.image = [UIImage imageNamed:@"go.png"];
        
        self.textL = [[UILabel alloc]init];
        self.textL.text = @"现在出发";
        self.textL.textColor = BaseColor;
        self.textL.font = [UIFont systemFontOfSize:11.0];
        [self addSubview:self.textL];
        [self.textL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.goView.mas_bottom).with.offset(5);
            make.height.equalTo(@20);
        }];
        
        self.vLabel = [[UILabel alloc]init];
        self.vLabel.backgroundColor = BaseColor;
        [self addSubview:self.vLabel];
        [self.vLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.textL.mas_bottom).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(1, 5));
        }];
    }
    return self;
}

@end
