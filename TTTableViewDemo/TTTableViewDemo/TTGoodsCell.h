//
//  TTGoodsCell.h
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/22.
//  Copyright © 2016年 TT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STgoods.h"


@interface TTGoodsCell : UITableViewCell

@property (nonatomic,strong) STgoods *goods;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *buynumber;

//封装自定义cell的方法
+ (instancetype)goodsCellWithTableView:(UITableView *)tableView;

@end
