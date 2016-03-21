//
//  TTCars.h
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/18.
//  Copyright © 2016年 TT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTCars : NSObject

@property (nonatomic,strong) NSArray *cars;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *index;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)carsWithDict:(NSDictionary *)dict;



@end
