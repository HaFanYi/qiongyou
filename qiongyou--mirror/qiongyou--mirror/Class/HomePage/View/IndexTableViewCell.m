//
//  IndexTableViewCell.m
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/16.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "IndexTableViewCell.h"
#import "indexInfoModel.h"
@implementation IndexTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.coverImageV = [[UIImageView alloc]init];
        [self addSubview:self.coverImageV];
        [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(kScreenW, 150));
        }];
        self.tagLabel = [[UILabel alloc]init];
        [self addSubview:self.tagLabel];
        self.tagLabel.backgroundColor = BaseColor;
        self.tagLabel.textColor = [UIColor whiteColor];
        self.tagLabel.textAlignment = NSTextAlignmentCenter;
        self.tagLabel.font = [UIFont systemFontOfSize:11.0];
        [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(35, 20));
        }];
        self.titleLabel = [[UILabel alloc]init];
        [self addSubview:self.titleLabel];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:18.0];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageV.mas_bottom).with.offset(10);
            make.left.equalTo(self).with.offset(18.0);
            make.centerX.equalTo(self);
        }];
        self.subjectLabel = [[UILabel alloc]init];
        [self addSubview:self.subjectLabel];
        self.subjectLabel.textColor = textFontColor;
        self.subjectLabel.font = [UIFont systemFontOfSize:13.0];
        self.subjectLabel.numberOfLines = 0;
        self.subjectLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.subjectLabel.textAlignment = NSTextAlignmentCenter;
        [self.subjectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self).with.offset(16.0);
            make.centerX.equalTo(self);
        }];
        self.iconImageV = [[UIImageView alloc]init];
        [self addSubview:self.iconImageV];
        [self.iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.subjectLabel.mas_bottom).with.offset(10);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
  }
    return self;
}
+ (CGFloat)heightForCellWithText:(NSString *)text font:(CGFloat)font{
    return (CGFloat)fmaxf((float)[self detailTextHeight:text font:font], (float)[self detailTextHeight:text font:font]);
}

+ (CGFloat)detailTextHeight:(NSString *)text font:(CGFloat)font{
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(kScreenW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]} context:nil];
    return rectToFit.size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
