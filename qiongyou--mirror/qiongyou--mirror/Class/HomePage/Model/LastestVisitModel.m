//
//  LastestVisitModel.m
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/9.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "LastestVisitModel.h"

@implementation LastestVisitModel
- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [attributes valueForKey:@"title"];
    self.city_id = [[attributes valueForKey:@"city_id"]integerValue];
    self.city_name = [attributes valueForKey:@"city_name"];
    self.cover = [attributes valueForKey:@"cover"];
    self.tab = [attributes valueForKey:@"tab"];
    self.recommend_city = [attributes valueForKey:@"recommend_city"];

    return self;
}

+ (NSURLSessionDataTask *) city_id:(NSUInteger)city_id globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    NSString *home_city = [NSString stringWithFormat:@"home_city_info?city_ids=%lu&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&page=1&v=1",(unsigned long)city_id];
    NSString *url = [NSString stringWithFormat:@"%s%@",prefix_url,home_city];
    return [[HttpsRequest  shareManager] POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            NSMutableArray *info_arr = [NSMutableArray arrayWithCapacity:0];
            NSDictionary *infoDic = responseObject[@"data"];
            LastestVisitModel *visit = [[LastestVisitModel alloc]initWithAttributes:infoDic];
            [info_arr addObject:visit];
            block([NSArray arrayWithArray:info_arr], nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block([NSArray array], error);
        }
    }];


}

@end
