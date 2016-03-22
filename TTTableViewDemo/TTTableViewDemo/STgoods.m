//
//  STgoods.m
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/22.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "STgoods.h"

@implementation STgoods

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)goodsWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
