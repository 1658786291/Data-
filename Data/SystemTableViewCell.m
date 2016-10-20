//
//  SystemTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/20.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "SystemTableViewCell.h"
@interface SystemTableViewCell()
@property (nonatomic, strong) UILabel *label;
@end

@implementation SystemTableViewCell

- (void)awakeFromNib {

    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.textLabel.textColor = [UIColor darkGrayColor];
   
    

}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.textLabel.x = 10;
    self.textLabel.y = 5;
    self.textLabel.height = 15;

    for ( UIView *view in self.contentView.subviews) {
       
        if (view.tag == 1000) {
            
            [view removeFromSuperview];
        }
        
    }
    if ([self.textLabel.text isEqualToString:@"新锐圈子"]) {

            self.label = [[UILabel alloc]initWithFrame:CGRectMake(kWidth -40,5, 30, 10)];
            self.label.text = @"更多";
            self.label.tag = 1000;
            self.label.textAlignment = NSTextAlignmentRight;
            self.label.textColor = [UIColor lightGrayColor];
            self.label.font = [UIFont systemFontOfSize:12];
            [self.contentView addSubview:self.label];
        self.label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [self.label addGestureRecognizer:tap];
        
    }
}

-(void)tap{
    
    NSLog(@"点击了");
    self.userInteractionEnabled = ! self.userInteractionEnabled;
    
    
}

@end
