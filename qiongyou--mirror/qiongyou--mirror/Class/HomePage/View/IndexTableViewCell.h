//
//  IndexTableViewCell.h
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/16.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "indexInfoModel.h"
@interface IndexTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel *tagLabel;
@property (nonatomic, strong)UIImageView *coverImageV;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subjectLabel;
@property (nonatomic, strong)UIImageView *iconImageV;

+ (CGFloat)heightForCellWithText:(NSString *)text font:(CGFloat)font;
@end
