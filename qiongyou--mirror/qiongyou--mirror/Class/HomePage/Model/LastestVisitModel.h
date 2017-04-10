//
//  LastestVisitModel.h
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/9.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LastestVisitModel : NSObject
@property (nonatomic, strong)NSString *title;
@property (nonatomic)NSInteger city_id;
@property (nonatomic, strong)NSString *city_name;
@property (nonatomic, strong)NSString *cover;
@property (nonatomic, strong)NSArray *tab;
@property (nonatomic,strong)NSArray *recommend_city;

+ (NSURLSessionDataTask *) city_id:(NSUInteger)city_id globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;
@end
