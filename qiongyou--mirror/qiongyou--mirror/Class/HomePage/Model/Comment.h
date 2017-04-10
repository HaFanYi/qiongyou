//
//  Comment.h
//  QiongQiuDemo
//
//  Created by watchman on 2017/3/30.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

/**
 *标题
 */
@property (nonatomic, strong)NSString *title;

/**
 *url
 */
@property (nonatomic, strong)NSString *url;

/**
 *icol_url
 */
@property (nonatomic, strong)NSString *icon_url;

/**
 *是否需要登录
 */
@property (nonatomic)NSUInteger need_login;

/**
 *页面标题
 */
@property (nonatomic, strong)NSString *page_title;

/**
 *target
 */
@property (nonatomic)NSUInteger target;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
@end
