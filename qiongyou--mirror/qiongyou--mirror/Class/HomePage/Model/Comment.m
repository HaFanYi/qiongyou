//
//  Comment.m
//  QiongQiuDemo
//
//  Created by watchman on 2017/3/30.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "Comment.h"

@implementation Comment

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.title = [attributes valueForKey:@"title"];
    self.url = [attributes valueForKeyPath:@"url"];
    self.icon_url = [attributes valueForKeyPath:@"icon_url"];
    self.need_login = [[attributes valueForKeyPath:@"need_login"] integerValue];
    self.page_title = [attributes valueForKey:@"page_title"];
    self.target = [[attributes valueForKey:@"target"] integerValue];
    return self;
    

}
@end
