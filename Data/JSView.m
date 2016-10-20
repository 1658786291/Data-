//
//  JSView.m
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "JSView.h"
@interface JSView()
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end
@implementation JSView

+(instancetype)viewFromXib{
    
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    
}

-(void)setModel:(DIYModel *)model{
    
    _model = model;
    [self.logoImage sd_setImageWithURL:[NSURL URLWithString:model.img]placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.nameLabel.text = model.text;

    
}
@end
