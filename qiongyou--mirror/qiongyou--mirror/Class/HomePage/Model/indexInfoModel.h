//
//  indexInfoModel.h
//  QiongQiuDemo
//
//  Created by watchman on 2017/3/30.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SildeModel;
@class Comment;
@interface indexInfoModel : NSObject
@property (nonatomic, strong)SildeModel *slideM;
@property (nonatomic, strong)Comment *comment;

/**
 *id
 */
@property (nonatomic)NSUInteger id;

/**
 *类型
 */
@property (nonatomic)NSUInteger type;

/**
 *分类
 */
@property (nonatomic, strong)NSString *column;

/**
 *标题
 */
@property (nonatomic, strong)NSString *title;

/**
 *url
 */
@property (nonatomic, strong)NSString *url;

/**
 *封面
 */
@property (nonatomic, strong)NSString *cover;

/**
 *作者
 */
@property (nonatomic, strong)NSString *username;

/**
 *头像
 */
@property (nonatomic, strong)NSString *pic;

/**
 *subject
 */
@property (nonatomic, strong)NSString *subject;

/**
 *icon_url
 */
@property (nonatomic, strong)NSString *icon_url;

+ (NSURLSessionDataTask *)globalTimelinePostsWithPage:(NSUInteger)page Block:(void (^)(NSArray *posts, NSError *error))block ;
@end
