//
//  DIYModel.h
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIYModel : NSObject
/**DIY的文本*/
@property (nonatomic, copy) NSString *text;
/**DIY的img*/
@property (nonatomic, copy) NSString *img;
/**内容的大小*/
@property (nonatomic, assign) CGRect contentFrame;
/**单元格的大小*/
@property (nonatomic, assign) CGFloat cellHeight;


@end
