//
//  HomePageHeadView.h
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/8.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageHeadView : UIView<LeeScrollViewDelegate>
@property (nonatomic, strong)LeeScrollView *leeScrollV;
@property (nonatomic, strong)NSArray *sliderArr;
@property (nonatomic, strong)NSMutableArray *imageArr;
@property (nonatomic, strong)UILabel *searchLabel;

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArr;
@end
