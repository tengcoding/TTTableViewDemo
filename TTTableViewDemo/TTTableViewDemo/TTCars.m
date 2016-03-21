//
//  TTCars.m
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/18.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "TTCars.h"

@implementation TTCars

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carsWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
