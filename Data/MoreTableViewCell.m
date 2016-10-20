
//
//  MoreTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "MoreView.h"
@interface MoreTableViewCell()

@property (nonatomic, assign) UILabel  *line;
@property (nonatomic, strong) MoreView *moreView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *quan_name;
@property (weak, nonatomic) IBOutlet UILabel *more;

@end
@implementation MoreTableViewCell

-(MoreView*)moreView{
    
    if (_moreView == nil) {
        
        _moreView = [MoreView new];
        [self.contentView addSubview:_moreView];
    }
    return _moreView;
    
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
    self.moreView.frame = model.contentFrame;
    self.moreView.model = model;
    self.title.text = model.title;
    self.quan_name.text = model.quan_name;
    self.more.text = [NSString stringWithFormat:@"评论%ld  %@",(long)model.comment_count,model.add_time];
    
    
    
    
}

@end
