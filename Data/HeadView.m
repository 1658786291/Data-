//
//  HeadView.m
//  Aisino
//
//  Created by Aisino on 16/5/30.
//  Copyright © 2016年 JSHT. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

-(void)layoutSubviews{
    
    [super layoutSubviews];
  
  

}

-(void)setFrame:(CGRect)frame{
    
    frame.size.height = 0;
    [super setFrame:frame];
}

@end
