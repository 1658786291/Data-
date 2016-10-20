//
//  LitterTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "LitterTableViewCell.h"
@interface LitterTableViewCell()

@property (nonatomic, assign) UILabel  *line;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *more;
@property (nonatomic, strong) UIImageView *image;

@end
@implementation LitterTableViewCell

-(UIImageView*)image{
    
    if (!_image) {
        
        _image = [[UIImageView alloc]init];
        [self.contentView addSubview:_image];

    }
    return _image;
    
}

- (void)awakeFromNib {
    
 
    UILabel *line = [[UILabel alloc]init];
    
    line.x = 0;
    
    line.width = kWidth;
    line.height = 1;
    line.backgroundColor =  [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    self.line = line;
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.line.y = self.height-1;
    
    
}

-(void)setModel:(StudyModel *)model{
    _model = model;
    CGFloat width = (160*70)/120.0;
    self.image.frame = CGRectMake(kWidth - width - 10, 5, width, 70);
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.img[0]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.title.text = model.title;
    self.name.text = model.quan_name;
    self.more.text = [NSString stringWithFormat:@"评论%ld %@",(long)model.comment_count,model.add_time];
    

}

@end
