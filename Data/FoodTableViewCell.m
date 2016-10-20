//
//  FoodTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/20.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "FoodTableViewCell.h"
@interface FoodTableViewCell()

@property (nonatomic, assign) UILabel  *line;

@end

@implementation FoodTableViewCell

- (void)awakeFromNib {
    
    UILabel *line = [[UILabel alloc]init];
    
    line.x = 0;
    
    line.width = kWidth;
    line.height = 1;
    line.backgroundColor =  [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    self.line = line;
    self.textLabel.font = [UIFont systemFontOfSize:15];
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.x = 10;
    self.imageView.y = 5;
    self.imageView.width = kWidth -20;
    self.imageView.height = kWidth *266.0 / 400.0;
    self.textLabel.x = 10;
    self.textLabel.y = self.imageView.height + 5 + 5;
    self.textLabel.height = 20;
    self.textLabel.width = kWidth;
    self.line.y = self.height-1;
    
}

-(void)setModel:(DIYModel *)model{
    
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_model.img]]placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.textLabel.text = _model.text;
    
}

@end
