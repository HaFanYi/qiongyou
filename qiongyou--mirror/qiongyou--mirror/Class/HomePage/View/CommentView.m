//
//  CommentTableViewCell.m
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/12.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "CommentView.h"
#import "Comment.h"
@implementation CommentView
{
    NSArray *data;
}
- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArr {
    self = [super initWithFrame:frame];
    if (self) {
        data = dataArr;
        Comment *model = dataArr[0];
        self.iconView = [[UIImageView alloc]init];
        [self addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.icon_url] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
        self.titlelabel = [[UILabel alloc]init];
        [self addSubview:self.titlelabel];
        [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.iconView.mas_right).with.offset(5);
            make.size.mas_equalTo(self);
        }];
        self.titlelabel.text = model.title;
        self.titlelabel.textColor = [UIColor blackColor];
        self.titlelabel.font = [UIFont systemFontOfSize:13.0];
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
        self.iconView.userInteractionEnabled = YES;
        self.titlelabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self.iconView addGestureRecognizer:tap1];
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self.titlelabel addGestureRecognizer:tap2];
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    Comment *model = data[0];
    if (model.need_login == 1) {
        NSLog(@"去登陆...");
    }else {
        NSLog(@"%@",model.url);
    }
}
@end
