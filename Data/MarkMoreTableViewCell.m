


//
//  MarkMoreTableViewCell.m
//  Data
//
//  Created by Aisino on 16/7/21.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "MarkMoreTableViewCell.h"
@interface MarkMoreTableViewCell()

@property (nonatomic, strong) UIImageView *image;


@end
@implementation MarkMoreTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    
        
    }
    return self;
    
    
}

-(void)setDataArray:(NSMutableArray *)dataArray{
    
    _dataArray = dataArray;
    for (UIView *view in self.contentView.subviews) {
        
        [view removeFromSuperview];
        
    }
  
    CGFloat width = (kWidth -30)/2.0;
    CGFloat offx = width +10;
    for (int i = 0; i < dataArray.count; i++) {
    
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10+offx*(i%2), 5+(width+25)*(i / 2), width, width)];
        [self.contentView addSubview:image];
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.x = image.x;
        titleLabel.y = image.bottom+5;
        titleLabel.width = image.width;
        titleLabel.height = 20;
        /*
         
         lineBreakMode：设置标签文字过长时的显示方式。
         label.lineBreakMode = NSLineBreakByCharWrapping;    //以字符为显示单位显示，后面部分省略不显示。
         label.lineBreakMode = NSLineBreakByClipping;        //剪切与文本宽度相同的内容长度，后半部分被删除。
         label.lineBreakMode = NSLineBreakByTruncatingHead;  //前面部分文字以……方式省略，显示尾部文字内容。
         label.lineBreakMode = NSLineBreakByTruncatingMiddle;    //中间的内容以……方式省略，显示头尾的文字内容。
         label.lineBreakMode = NSLineBreakByTruncatingTail;  //结尾部分的内容以……方式省略，显示头的文字内容。
         label.lineBreakMode = NSLineBreakByWordWrapping;    //以单词为显示单位显示，后面部分省略不显示。
         
         
         */
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
       
        titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:titleLabel];
        
        MarkModel *model = self.dataArray[i];
        [image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.img_url]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        titleLabel.text = model.title;

    }
}

@end
