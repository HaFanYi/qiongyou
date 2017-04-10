//
//  VisitHistoryView.m
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/9.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "VisitHistoryView.h"
#import "LastestVisitModel.h"

@implementation VisitHistoryView

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArr {
    self = [super initWithFrame:frame];
    if (self) {
        self.data = [NSMutableArray arrayWithCapacity:0];
        self.data = dataArr;
        LastestVisitModel *model = self.data[0];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3.5;
        self.layer.borderWidth = 1;
        self.layer.borderColor = BorderColor.CGColor;
        self.coverImageV = [[UIImageView alloc]init];
        [self addSubview:self.coverImageV];
        self.coverImageV.userInteractionEnabled = YES;
        [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 90));
        }];
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.cover]];
//        UIImage *image = [UIImage imageWithData:data];
//        self.coverImageV.image = [self blurryImage:image withBlurLevel:0.45];
        [self.coverImageV sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
//        self.coverImageV.contentMode = UIViewContentModeScaleAspectFit;
//        CIContext *context = [CIContext contextWithOptions:nil];
//        CIImage *image = [CIImage imageWithContentsOfURL:[NSURL URLWithString:model.cover]];
//        CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
//        [filter setValue:image forKey:kCIInputImageKey];
//        [filter setValue:@2.34f forKey: @"inputRadius"];
//        CIImage *result = [filter valueForKey:kCIOutputImageKey];
//        CGImageRef outImage = [context createCGImage: result fromRect:[result extent]];
//        UIImage * blurImage = [UIImage imageWithCGImage:outImage];
//        self.coverImageV.image = blurImage;
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:0.80];
        [self.coverImageV addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 90));
        }];
        self.titleLabel = [[UILabel alloc]init];
        [self.coverImageV addSubview:self.titleLabel];
        self.titleLabel.font = [UIFont systemFontOfSize:12.0 weight:1.0];
        self.titleLabel.textColor = BackGround_Color;
        self.titleLabel.text = [NSString stringWithFormat:@"%@",model.title];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).with.offset(15);
            make.height.equalTo(@10);
        }];
        self.city_nameLabel = [[UILabel alloc]init];
        [self.coverImageV addSubview:self.city_nameLabel];
        self.city_nameLabel.textColor = [UIColor whiteColor];
        self.city_nameLabel.font = [UIFont systemFontOfSize:19.0 weight:3.0];
        self.city_nameLabel.text = [NSString stringWithFormat:@"%@", model.city_name];
        [self.city_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.coverImageV);
            make.height.equalTo(@20);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
        view.userInteractionEnabled = YES;
        self.titleLabel.userInteractionEnabled = YES;
        self.city_nameLabel.userInteractionEnabled = YES;
        [view addGestureRecognizer:tap];
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
        [self.titleLabel addGestureRecognizer:tap1];
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
        [self.city_nameLabel addGestureRecognizer:tap2];
        view.tag = model.city_id;
        self.titleLabel.tag = model.city_id;
        self.city_nameLabel.tag = model.city_id;
        
        self.playIconImageV = [[UIImageView alloc]init];
        self.playIconImageV.userInteractionEnabled = YES;
        [self addSubview:self.playIconImageV];
        [self.playIconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageV.mas_bottom).with.offset(15);
            make.left.equalTo(self).with.offset(25);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-180)/4, 40));
        }];
        self.playLabel = [[UILabel alloc]init];
        self.playLabel.textColor = [UIColor blackColor];
        self.playLabel.font = [UIFont systemFontOfSize:13.0];
        self.playLabel.textAlignment = NSTextAlignmentLeft;
        self.playLabel.userInteractionEnabled = YES;
        [self addSubview:self.playLabel];
        [self.playLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playIconImageV.mas_bottom).with.offset(0);
            make.centerX.equalTo(self.playIconImageV.mas_centerX);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-130)/4, 20));
        }];
        
        self.foodIconImageV = [[UIImageView alloc]init];
        [self addSubview:self.foodIconImageV];
        self.foodIconImageV.userInteractionEnabled = YES;
        [self.foodIconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageV.mas_bottom).with.offset(15);
            make.left.equalTo(self.playIconImageV.mas_right).with.offset(35);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-180)/4, 40));
        }];
        self.foodLabel = [[UILabel alloc]init];
        self.foodLabel.textColor = [UIColor blackColor];
        self.foodLabel.font = [UIFont systemFontOfSize:13.0];
        self.foodLabel.textAlignment = NSTextAlignmentCenter;
        self.foodLabel.userInteractionEnabled = YES;
        [self addSubview:self.foodLabel];
        [self.foodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.foodIconImageV.mas_bottom).with.offset(0);
            make.centerX.equalTo(self.foodIconImageV.mas_centerX);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-130)/4, 20));
        }];
        
        self.qyerguideIconImageV = [[UIImageView alloc]init];
        [self addSubview:self.qyerguideIconImageV];
        self.qyerguideIconImageV.userInteractionEnabled = YES;
        [self.qyerguideIconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageV.mas_bottom).with.offset(15);
            make.left.equalTo(self.foodIconImageV.mas_right).with.offset(55);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-180)/4, 40));
        }];
        self.qyerguideLabel = [[UILabel alloc]init];
        self.qyerguideLabel.textColor = [UIColor blackColor];
        self.qyerguideLabel.font = [UIFont systemFontOfSize:13.0];
        self.qyerguideLabel.textAlignment = NSTextAlignmentCenter;
        self.qyerguideLabel.userInteractionEnabled = YES;
        [self addSubview:self.qyerguideLabel];
        [self.qyerguideLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.qyerguideIconImageV.mas_bottom).with.offset(0);
            make.centerX.equalTo(self.qyerguideIconImageV.mas_centerX);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-130)/4, 20));
        }];
        
        self.poilikeIconImageV = [[UIImageView alloc]init];
        [self addSubview:self.poilikeIconImageV];
        self.poilikeIconImageV.userInteractionEnabled = YES;
        [self.poilikeIconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageV.mas_bottom).with.offset(15);
            make.left.equalTo(self.qyerguideIconImageV.mas_right).with.offset(40);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-180)/4, 40));
        }];
        self.poilikeLabel = [[UILabel alloc]init];
        self.poilikeLabel.textColor = [UIColor blackColor];
        self.poilikeLabel.font = [UIFont systemFontOfSize:12.0];
        self.poilikeLabel.textAlignment = NSTextAlignmentCenter;
        self.poilikeLabel.userInteractionEnabled = YES;
        [self addSubview:self.poilikeLabel];
        [self.poilikeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.poilikeIconImageV.mas_bottom).with.offset(0);
            make.centerX.equalTo(self.poilikeIconImageV.mas_centerX);
            make.height.equalTo(@20);
        }];
        NSArray *tab = model.tab;
        for (NSDictionary *dic in tab) {
            if ([dic[@"icon_type"]  isEqualToString: @"play"]) {
                [self.playIconImageV sd_setImageWithURL:[NSURL URLWithString:dic[@"icon_url"]] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
                self.playLabel.text = [NSString stringWithFormat:@"%@",dic[@"name"]];
                self.playLabel.userInteractionEnabled = YES;
                self.playIconImageV.userInteractionEnabled = YES;
                self.playLabel.tag = 001;
                self.playIconImageV.tag = 001;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                [self.playIconImageV addGestureRecognizer:tap];
                [self.playLabel addGestureRecognizer:tap1];
            }else if ([dic[@"icon_type"] isEqualToString:@"food"]) {
                [self.foodIconImageV sd_setImageWithURL:[NSURL URLWithString:dic[@"icon_url"]] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
                self.foodLabel.text = [NSString stringWithFormat:@"%@",dic[@"name"]];
                self.foodLabel.userInteractionEnabled = YES;
                self.foodIconImageV.userInteractionEnabled = YES;
                self.foodLabel.tag = 002;
                self.foodIconImageV.tag = 002;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                [self.foodIconImageV addGestureRecognizer:tap];
                [self.foodLabel addGestureRecognizer:tap1];
            }else if ([dic[@"icon_type"] isEqualToString:@"qyerguide"]) {
                [self.qyerguideIconImageV sd_setImageWithURL:[NSURL URLWithString:dic[@"icon_url"]] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
                self.qyerguideLabel.text = [NSString stringWithFormat:@"%@",dic[@"name"]];
                self.qyerguideLabel.userInteractionEnabled = YES;
                self.qyerguideIconImageV.userInteractionEnabled = YES;
                self.qyerguideIconImageV.tag = 003;
                self.qyerguideLabel.tag = 003;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                [self.qyerguideLabel addGestureRecognizer:tap];
                [self.qyerguideIconImageV addGestureRecognizer:tap1];
            }else if ([dic[@"icon_type"] isEqualToString:@"poilike"]) {
                [self.poilikeIconImageV sd_setImageWithURL:[NSURL URLWithString:dic[@"icon_url"]] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
                self.poilikeLabel.text = [NSString stringWithFormat:@"%@",dic[@"name"]];
                self.poilikeLabel.userInteractionEnabled = YES;
                self.poilikeIconImageV.userInteractionEnabled = YES;
                self.poilikeIconImageV.tag = 004;
                self.poilikeLabel.tag = 004;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoCityPage:)];
                [self.poilikeLabel addGestureRecognizer:tap];
                [self.poilikeIconImageV addGestureRecognizer:tap1];
            }
        }

        UILabel *moreLabel = [[UILabel alloc]init];
        moreLabel.text = @"更多城市";
        moreLabel.textColor = [UIColor grayColor];
        moreLabel.textAlignment = NSTextAlignmentCenter;
        moreLabel.font = [UIFont systemFontOfSize:10.0];
        [self addSubview:moreLabel];
        [moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.playLabel.mas_bottom).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(45, 10));
        }];
        UILabel *line1 = [[UILabel alloc]init];
        line1.backgroundColor = BorderColor;
        [self addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playLabel.mas_bottom).with.offset(20);
            make.left.equalTo(self);
            make.right.equalTo(moreLabel.mas_left).with.offset(0);
            make.height.equalTo(@1);
        }];
        UILabel *line2 = [[UILabel alloc]init];
        line2.backgroundColor = BorderColor;
        [self addSubview:line2];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playLabel.mas_bottom).with.offset(20);
            make.right.equalTo(self);
            make.left.equalTo(moreLabel.mas_right).with.offset(0);
            make.height.equalTo(@1);
        }];
        NSArray *cityArr = model.recommend_city;
        for (int i = 0; i < cityArr.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(18+i*((self.frame.size.width-80)/3+23));
            make.bottom.equalTo(self).with.offset(-15);
            make.size.mas_equalTo(CGSizeMake((self.frame.size.width-80)/3, 28));
        }];
            NSDictionary *dic = cityArr[i];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:11];
            btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
            [btn setTitle:dic[@"city_name"] forState:UIControlStateNormal];
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 14;
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [UIColor greenColor].CGColor;
            btn.tag = [dic[@"id"] integerValue];
            [btn addTarget:self action:@selector(goCityPage:) forControlEvents:UIControlEventTouchUpInside];
    }
  }
    return self;
}

#pragma mark -点击最近访问cover
- (void)gotoCityPage:(UITapGestureRecognizer *)tap{
    switch (tap.view.tag) {
        case 001:
            NSLog(@"点击类型是:play");
            break;
        case 002:
            NSLog(@"点击类型是:food");
            break;
        case 003:
            NSLog(@"点击类型是:qyerguide");
            break;
        case 004:
            NSLog(@"点击类型是:poilike");
            break;
        default:
            NSLog(@"点击跳转的城市ID是：%ld", tap.view.tag);
            break;
    }
}
#pragma mark -更多城市点击跳转
- (void)goCityPage:(UIButton *)sender {
    NSLog(@"点击城市的ID是：%ld",sender.tag);
}
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur
{
    if (!image) {
        return nil;
    }
    if (blur < 0.f || blur > 1.f) {
        blur = 0.3f;
    }
    int boxSize = (int)(blur * 5);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    
    return returnImage;
    
}
@end
