//
//  indexInfoModel.m
//  QiongQiuDemo
//
//  Created by watchman on 2017/3/30.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "indexInfoModel.h"
#import "SildeModel.h"
#import "Comment.h"
@implementation indexInfoModel

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.id = [[attributes valueForKey:@"id"] integerValue];
    self.type = [[attributes valueForKey:@"type"]integerValue];
    self.column = [attributes valueForKey:@"column"];
    self.title = [attributes valueForKey:@"title"];
    self.url = [attributes valueForKey:@"url"];
    self.cover = [attributes valueForKey:@"cover"];
    self.username = [[attributes valueForKey:@"author"] valueForKey:@"usrname"];
    self.pic = [[attributes valueForKey:@"author"] valueForKey:@"pic"];
    self.subject = [attributes valueForKey:@"subject"];
    self.icon_url = [attributes valueForKey:@"icon_url"];
    return self;
}

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    NSString *url = [NSString stringWithFormat:@"%s%s",prefix_url,home_feed];
    return [[HttpsRequest  shareManager] POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:0];
             NSMutableArray *slide_arr = [NSMutableArray arrayWithCapacity:0];
             NSMutableArray *com_arr = [NSMutableArray arrayWithCapacity:0];
             NSMutableArray *info_arr = [NSMutableArray arrayWithCapacity:0];
            NSArray *postsFromResponse = responseObject[@"data"][@"feed"][@"entry"];
            NSArray *slideArr = responseObject[@"data"][@"slide"];
           NSDictionary *commentDic = responseObject[@"data"][@"comment_entry"];
            Comment *com = [[Comment alloc]initWithAttributes:commentDic];
            [com_arr addObject:com];
            for (NSDictionary *attr in slideArr) {
                SildeModel *slide = [[SildeModel alloc] initWithAttributes:attr];
                [slide_arr addObject:slide];
            }
            for (NSDictionary *attributes in postsFromResponse) {
                indexInfoModel *indexModel = [[indexInfoModel alloc]initWithAttributes:attributes];
                [info_arr addObject:indexModel];
            }
            [mutablePosts addObject:slide_arr];
            [mutablePosts addObject:com_arr];
            [mutablePosts addObject:info_arr];
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block([NSArray array], error);
        }
    }];

}


- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@"" forKey:key];
}
@end
