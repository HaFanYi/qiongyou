//
//  CommentTableViewCell.h
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/12.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentView : UIView
@property (nonatomic, strong)UILabel *titlelabel;
@property (nonatomic, strong)UIImageView *iconView;

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArr;

@end
