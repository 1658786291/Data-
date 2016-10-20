//
//  JSTabBar.m
//  Pods
//
//  Created by Aisino on 16/7/18.
//
//

#import "JSTabBar.h"
#import "JSHomeController.h"
#import "JSCommunityController.h"
#import "JSMarkController.h"
#import "JSNav.h"
@interface JSTabBar ()

@end

@implementation JSTabBar

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setOneViewController:[JSHomeController new] title:@"首页" image:@"tabBar_essence_icon"  selectImage:@"tabBar_essence_click_icon"];
    [self setOneViewController:[JSMarkController new] title:@"市集" image:@"tabBar_new_icon"  selectImage:@"tabBar_new_click_icon"];
    [self setOneViewController:[JSCommunityController new] title:@"社区" image:@"tabBar_essence_icon"  selectImage:@"tabBar_essence_click_icon"];
    
    
}

#pragma  mark - 添加
-(void)setOneViewController:(UIViewController*)controller title:(NSString*)title image:(NSString*)image selectImage:(NSString*)selectImage{
    
    JSNav *nav = [[JSNav alloc]initWithRootViewController:controller];
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
    
    
}

@end
