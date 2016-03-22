//
//  STgoods.h
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/22.
//  Copyright © 2016年 TT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STgoods : NSObject
/**
 *  购买数量
 */
@property (nonatomic,copy) NSString *buyCount;
/**
 *  图标
 */
@property (nonatomic,copy) NSString *icon;
/**
 *  价格
 */
@property (nonatomic,copy) NSString *price;
/**
 *  名称
 */
@property (nonatomic,copy) NSString *title;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)goodsWithDict:(NSDictionary *)dict;



@end
