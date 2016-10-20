//
//  JSHomeController.m
//  TextData
//
//  Created by Aisino on 16/7/18.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "JSHomeController.h"
#import "FisrtViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "JSButton.h"
@interface JSHomeController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *bigScr;
@property (nonatomic, strong) JSButton *selectBtn;
@property (nonatomic, strong) UIView *indaView;
@property (nonatomic, strong) UIScrollView *smallScr;

@end

@implementation JSHomeController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"首页";
    [self addChildView];
    [self BigScrollView];
    [self SetUpTitle];
    [self addChild];
    
}
// 保证每次出来的都是第一个
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear: YES];
    self.bigScr.contentOffset =CGPointZero;
    JSButton *btn = self.smallScr.subviews[0];
    [self titleClick:btn];
    [self addChild];
    
}

#pragma  mark 创建子视图
-(void)addChildView{
    
    NSLog(@"=====%@",NSHomeDirectory());
    FisrtViewController *first = [FisrtViewController new];
    [self addChildViewController:first];
    
    SecondViewController *second = [SecondViewController new];
    [self addChildViewController:second];
    
    ThreeViewController *three = [ThreeViewController new];
    [self addChildViewController:three];
    
    FourViewController *four = [FourViewController new];
    [self addChildViewController:four];
    
    FiveViewController *five = [FiveViewController new];
    [self addChildViewController:five];
    
    
}

#pragma  mark 创建大的滑动
-(void)BigScrollView{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *bigScr = [[UIScrollView alloc]init];
    bigScr.delegate = self;
    bigScr.frame = [UIScreen mainScreen].bounds;
    bigScr.pagingEnabled = YES;
    bigScr.bounces = NO;
    bigScr.showsHorizontalScrollIndicator = NO;
    bigScr.showsVerticalScrollIndicator = NO;
    NSInteger count = self.childViewControllers.count;
    bigScr.contentSize = CGSizeMake(count*bigScr.width, 0);
    [self.view addSubview:bigScr];
    self.bigScr =  bigScr;
    
}

#pragma  mark - 上面的标题栏
-(void)SetUpTitle{
    
    UIScrollView *smallScr = [[UIScrollView alloc]init];
    smallScr.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.8];
    smallScr.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 40);
    [self.view addSubview:smallScr];
    NSArray *title = @[@"推荐",@"晒宝",@"布艺",@"编织",@"粘土"];
    NSInteger count = title.count;
    CGFloat titleButtonW = 100;
    CGFloat titleButtonH = smallScr.height;
    for (int i = 0; i < count; i++) {
        // 创建
        JSButton *titleButton = [JSButton buttonWithType:UIButtonTypeCustom];
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [smallScr addSubview:titleButton];
        titleButton.tag = i;
        
        // 设置数据
        [titleButton setTitle:title[i] forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        if (i==0) {
            titleButton.selected = YES;
            self.selectBtn = titleButton;
        }
        if (i == 4) {
            
            smallScr.contentSize = CGSizeMake(CGRectGetMaxY(titleButton.frame), 0);
        }
        
    }
    
    JSButton *btn = smallScr.subviews.firstObject;
    // 底部指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [ UIColor redColor];
    // 系统计算需要花费时间
    [btn.titleLabel sizeToFit];
    indicatorView.height = 1;
    indicatorView.width = btn.titleLabel.width;
    indicatorView.centerX = btn.centerX;
    indicatorView.y = smallScr.height - indicatorView.height;
    [smallScr addSubview:indicatorView];
    self.smallScr = smallScr;
    self.indaView = indicatorView;
    
    
}

-(void)titleClick:(JSButton*)btn{
  
    CGFloat originX = btn.x+btn.width - self.smallScr.width;
   
    if (originX < 0) {
        originX = 0;
         [self.smallScr setContentOffset:CGPointMake(0, 0) animated:YES];
    }else {
          [self.smallScr setContentOffset:CGPointMake(originX, 0) animated:YES];
    }


    

    self.selectBtn.selected = NO;
    btn.selected = YES;
    
    //缩放动画 上一次选中的按钮变为原来的字体的大小
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = [NSNumber numberWithFloat:1.2f];
    animation1.toValue  = [NSNumber numberWithFloat:1.0f];
    animation1.duration = 0.3;
    animation1.repeatCount = 1;
    animation1.fillMode = kCAFillModeForwards;
    // 默认为YES 代表动画结束自动移除该动画，如果再次想使用这个动画必须设置为NO
    animation1.removedOnCompletion = NO;
    // 动画结束是否返回原来的值  YES 是默认返回原先的值
    animation1.autoreverses = NO;
    [self.selectBtn.titleLabel.layer addAnimation:animation1 forKey:@"animation1"];
    
    // 当前的按钮字体变大
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithFloat:1.0f];
    animation2.toValue  = [NSNumber numberWithFloat:1.2f];
    animation2.duration = 0.3;
    animation2.repeatCount = 1;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    animation2.autoreverses = NO;
    [btn.titleLabel.layer addAnimation:animation2 forKey:@"animation2"];
 
    // 记录上一次选中的按钮
    self.selectBtn = btn;
    
    // 指示器
    [UIView animateWithDuration:0.25 animations:^{
        
        self.indaView.width = btn.titleLabel.width;
        self.indaView.centerX = btn.centerX;
        
    }];
    
    CGPoint offset = self.bigScr.contentOffset;
    offset.x = btn.tag * self.bigScr.width;
    
    [self.bigScr setContentOffset:offset animated:YES];
    }

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    if (scrollView == self.bigScr) {
        
           [self addChild];
        
    }
 
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x/ scrollView.width;
    JSButton *btn = self.smallScr.subviews[index];
    [self titleClick:btn];
    [self addChild];
}
-(void)addChild{
    
    NSInteger index = self.bigScr.contentOffset.x / self.bigScr.width;
    UIViewController *view = self.childViewControllers[index];
    if ([view isViewLoaded]) return;
    //写成frame不对
    view.view.frame = self.bigScr.bounds;
    [self.bigScr addSubview:view.view];
    
}
@end
