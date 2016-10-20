//
//  MarkModel.h
//  Data
//
//  Created by Aisino on 16/7/20.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarkModel : NSObject

/**图片的网址*/
@property (nonatomic, copy) NSString *img_url;
/**图片的宽度*/
@property (nonatomic, assign) NSInteger img_width;
/**图片的高度*/
@property (nonatomic, assign) NSInteger img_height;
/**相关推荐的标题*/
@property (nonatomic, copy) NSString *title;
/**相关推荐的现有价格*/
@property (nonatomic, copy) NSString *price;
@end
