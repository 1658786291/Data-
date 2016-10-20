
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
// 懒加载
#define OALazy(object, assignment) (object = object ?: assignment)

// 模型
#import "DIYModel.h"
#import "StudyModel.h"
#import "NewModel.h"
#import "MarkModel.h"

// 无限轮播
#import "SDCycleScrollView.h"

// SDWebImage
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

// 间隔
#define kOFF   10.0

// 网络请求
#import "Http.h"
#import "MJExtension.h"
#import "JSMJFooter.h"
#import "JSMJHeader.h"