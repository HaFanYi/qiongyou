//
//  HomePageHeadView.m
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/8.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "HomePageHeadView.h"
#import "SildeModel.h"
@implementation HomePageHeadView

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArr{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageArr = [NSMutableArray arrayWithCapacity:0];
        self.sliderArr = dataArr;
        for (int i = 0; i < dataArr.count; i++) {
             SildeModel *model = dataArr[i];
            [self.imageArr addObject:model.photo];
        }
        self.backgroundColor = [UIColor whiteColor];
        self.leeScrollV = [[LeeScrollView alloc]init];
        [self addSubview:self.leeScrollV];
        [self.leeScrollV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self);
             make.size.mas_equalTo(CGSizeMake(kScreenW, 200));
        }];
        self.leeScrollV.placeholderImage = [UIImage imageNamed:@"LeePlaceholder.png"];
        self.leeScrollV.imageArray = self.imageArr;
        self.leeScrollV.delegate = self;
        self.leeScrollV.time = 3;
        //设置分页控件指示器的颜色
        [self.leeScrollV setPageColor:[UIColor lightGrayColor] andCurrentPageColor:[UIColor whiteColor]];
        //设置图片切换的方式
        self.leeScrollV.changeMode = ChangeModeFade;
        
        self.searchLabel = [[UILabel alloc]init];
        [self addSubview:self.searchLabel];
        self.searchLabel.layer.masksToBounds = YES;
        self.searchLabel.layer.borderWidth = 0.7;
        self.searchLabel.layer.cornerRadius = 5;
        self.searchLabel.layer.borderColor = [UIColor greenColor].CGColor;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(search:)];
        [self.searchLabel addGestureRecognizer:tap];
        self.searchLabel.userInteractionEnabled = YES;
        self.searchLabel.text = @"🔍搜索目的地、锦囊、游记、特价、穷游er";
        self.searchLabel.textAlignment = NSTextAlignmentCenter;
        self.searchLabel.font = [UIFont systemFontOfSize:14];
        [self.searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(self.frame.size.width-20, 30));
        }];
    }
    return self;
}

#pragma mark -手势响应事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //清除缓存
    [LeeScrollView clearDiskCache];
    
}
#pragma mark LeeScrollViewDelegate
- (void)leeScrollView:(LeeScrollView *)leeScrollView clickImageAtIndex:(NSInteger)index {
    SildeModel *model = self.sliderArr[index];
    NSLog(@"%@",model.url);
}

- (void)search:(UITapGestureRecognizer *)sender {
    NSLog(@"search....");
}
@end
