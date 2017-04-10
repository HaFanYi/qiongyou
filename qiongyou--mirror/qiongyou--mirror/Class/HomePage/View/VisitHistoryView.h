//
//  VisitHistoryView.h
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/9.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitHistoryView : UIView
@property (nonatomic, strong)UIImageView *coverImageV;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *city_nameLabel;
@property (nonatomic, strong)UILabel *playLabel;
@property (nonatomic, strong)UIImageView *playIconImageV;
@property (nonatomic, strong)UILabel *foodLabel;
@property (nonatomic, strong)UIImageView *foodIconImageV;
@property (nonatomic, strong)UILabel *qyerguideLabel;
@property (nonatomic, strong)UIImageView *qyerguideIconImageV;
@property (nonatomic, strong)UILabel *poilikeLabel;
@property (nonatomic, strong)UIImageView *poilikeIconImageV;
@property (nonatomic, strong)UIButton *city_nameBtn;

@property (nonatomic, strong)NSArray *data;

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArr;
@end
