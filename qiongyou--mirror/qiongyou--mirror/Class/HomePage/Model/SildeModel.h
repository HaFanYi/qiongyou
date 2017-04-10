//
//  SildeModel.h
//  QiongQiuDemo
//
//  Created by watchman on 2017/3/30.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SildeModel : NSObject
/**
 *跳转地址
 */
@property (nonatomic, strong)NSString *url;

/**
 *图片
 */
@property (nonatomic, strong)NSString *photo;

/**
 *是否为广告
 */
@property (nonatomic)NSUInteger is_ads;

/**
 *关键字
 */
@property (nonatomic, strong)NSString *keyword;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
@end
