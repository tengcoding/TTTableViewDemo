//
//  TTGoodsCell.m
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/22.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "TTGoodsCell.h"

@implementation TTGoodsCell

+ (instancetype)goodsCellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"MT_cell";
    TTGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TTGoodsCell" owner:nil options:nil] lastObject];
    }
    return cell;
    
}



- (void)setGoods:(STgoods *)goods{
    _goods = goods;
    self.icon.image = [UIImage imageNamed:goods.icon];
    self.title.text = goods.title;
    self.price.text = [NSString stringWithFormat:@"¥ %@" ,goods.price];
    self.buynumber.text = [NSString stringWithFormat:@"%@人已购买",goods.buyCount];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
