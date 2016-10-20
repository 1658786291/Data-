//
//  DetailViewController.m
//  Data
//
//  Created by Aisino on 16/7/25.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
#import "DetaiTableViewCell.h"
#import "JSHeight.h"
#import "Http.h"
@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonnull, strong) NSMutableDictionary *dict;

@end

@implementation DetailViewController
static NSString *const CellID = @"cell";
static NSString *const Cell = @"cell1";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.title = @"详细";
    [self  setTable];
}

-(void)setTable{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[DetailTableViewCell class] forCellReuseIdentifier:CellID];
     [self.tableView registerClass:[DetaiTableViewCell class] forCellReuseIdentifier:Cell];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
}

-(void)loadData{
    
    NSString *url = @"http://sdxapp.com/api/get.html?user_id=&act=GetSay&V=1.2.1&type=top&sign=e2a8371369807d017c84cc36&say_id=1958669&F=ios&mquan_id=556&key=1469409046179517638&min_id=&quan_id=";
    NSString *urlString = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [Http NetWorkGETWithRequestURL:urlString WithPara:nil WithSuccessBlock:^(id returnValue) {
        
        NSDictionary *dict = returnValue[@"data"];
        self.dict = (NSMutableDictionary*)dict;
        self.dataArray = dict[@"text"];
        [self.tableView reloadData];

//        for (NSDictionary *dic in self.dataArray) {
//            if (dic[@"text"]) {
//                
//                NSLog(@"====存在");
//                
//            }else{
//                NSLog(@"不存在");
//                
//            }
//            
//            
//        }
    } WithErroBlock:^(id erroCode) {
        
        
    } WithFailure:^(id error) {
        
        
    }];
    

    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = self.dataArray[indexPath.row];
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.dict = dic;
    return cell;
//        if (dic[@"text"]) {
//    
//        DetaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell forIndexPath:indexPath];
//        cell.dict = dic;
//        return cell;
//                    
//    }else{
//                   
//        DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
//        cell.dict = dic;
//        return cell;
//    }


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.dataArray[indexPath.row];
    if (dic[@"text"]) {
        
        return [JSHeight sizeHeight:dic[@"text"] WithFont:14]+20;
        
    }else{
        
        return  (300*kWidth) / 400.0;
        
    }
   
}

-(void)createHeadView{
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, kWidth, 60);
    [self.tableView setTableHeaderView:view];
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(0, 0, kWidth, 30);
    titleLabel.text = self.dict[@"title"];
    [view addSubview:titleLabel];
    
    
    
    
    
}



@end
