//
//  JSView.h
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSView : UIView

+(instancetype)viewFromXib;
@property (nonatomic, strong) DIYModel *model;

@end
