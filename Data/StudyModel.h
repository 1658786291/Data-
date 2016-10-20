//
//  StudyModel.h
//  Data
//
//  Created by Aisino on 16/7/19.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudyModel : NSObject

/**教程推荐的文本*/
@property (nonatomic, copy) NSString *title;
/**教程推荐的img*/
@property (nonatomic, strong) NSMutableArray *img;
/**教程推荐的作者*/
@property (nonatomic, copy) NSString *quan_name;
/**教程推荐的评论数*/
@property (nonatomic, assign) NSInteger comment_count;
/**教程推荐的时间*/
@property (nonatomic, copy) NSString *add_time;
/**内容的大小*/
@property (nonatomic, assign) CGRect contentFrame;
/**单元格的大小*/
@property (nonatomic, assign) CGFloat cellHeight;
@end
