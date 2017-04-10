//
//  SildeModel.m
//  QiongQiuDemo
//
//  Created by watchman on 2017/3/30.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "SildeModel.h"

@implementation SildeModel

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.is_ads = [[attributes valueForKeyPath:@"is_ads"] integerValue];
    self.url = [attributes valueForKeyPath:@"url"];
    self.photo = [attributes valueForKeyPath:@"photo"];
    self.keyword = [attributes valueForKey:@"keyword"];
    return self;

}
@end
