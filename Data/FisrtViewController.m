//
//  FisrtViewController.m
//  Data
//
//  Created by Aisino on 16/7/18.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "FisrtViewController.h"
#import "JSView.h"
#import "MoreTableViewCell.h"
#import "SystemTableViewCell.h"
#import "LitterTableViewCell.h"
#import "FoodTableViewCell.h"
#import "NewTableViewCell.h"
#import "DetailViewController.h"
@interface FisrtViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UIActivityIndicatorView *activityDic;

/**广告的数组*/
@property (nonatomic, strong) NSMutableArray <DIYModel*>*adArray;
/**DIY的数组*/
@property (nonatomic, strong) NSMutableArray <DIYModel*>*DIYArray;
/**没事诱惑的数组*/
@property (nonatomic, strong) NSMutableArray <DIYModel*>*foodArray;
/**教程推荐*/
@property (nonatomic, strong) NSMutableArray <StudyModel*> *studyArray;
/**新锐圈子的数组*/
@property (nonatomic, strong) NSMutableArray <NewModel*>*LatestArray;
/**大家都在看的数组*/
@property (nonatomic, strong) NSMutableArray <StudyModel*>*seeArray;
/**教程推荐的标题*/
@property (nonatomic, copy) NSString *studyTitle;
/**美食诱惑的标题*/
@property (nonatomic, copy) NSString *foodTitle;
/**新锐圈子的标题*/
@property (nonatomic, copy) NSString *latestTitle;
/**大家都在看的标题*/
@property (nonatomic, copy) NSString *seeTitle;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *titleArray;
/**加载的页数*/
@property (nonatomic, assign) NSInteger page;

@end

@implementation FisrtViewController

static NSString *const MoreCell = @"more";
static NSString *const OnlyCell = @"litter";
static NSString *const Cell = @"cell";
static NSString *const FoodCell = @"food";
static NSString *const NewCell = @"new";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTable];
    [self loadData];
    self.page = 2;
    [self.view addSubview:self.activityDic];
}
#pragma  mark 加载指示器
-(UIActivityIndicatorView*)activityDic{
    
    if (!_activityDic) {
        
        _activityDic = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityDic.x = kWidth/2.0 - _activityDic.width;
        _activityDic.y = kHeight/2.0 - _activityDic.height;
        [_activityDic startAnimating];
        
    }
    return _activityDic;
}

-(void)setTable{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MoreTableViewCell class]) bundle:nil] forCellReuseIdentifier:MoreCell];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LitterTableViewCell class]) bundle:nil] forCellReuseIdentifier:OnlyCell];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SystemTableViewCell class]) bundle:nil] forCellReuseIdentifier:Cell];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FoodTableViewCell class]) bundle:nil] forCellReuseIdentifier:FoodCell];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ NewTableViewCell class]) bundle:nil] forCellReuseIdentifier:NewCell];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;

}

#pragma  mark - 下拉刷新和上拉加载
-(void)loadData{
    
  
    self.tableView.mj_header = [JSMJHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    
  
    if (self.dataArray.count == 0) {
        
        [self loadNewData];
//        NSLog(@"第一次");
    
        
    }else{
        
//        [self.tableView.mj_header beginRefreshing];
        NSLog(@"第二次");
       
    }
     self.tableView.mj_footer = [JSMJFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
      [self.tableView.mj_footer setHidden:YES];
//   [self.tableView.mj_header beginRefreshing];
//    NSMutableArray *imageArray = [NSMutableArray array];
//    for (int i = 1; i < 3; i++) {
//        
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_loading_action%d",i]];
//        [imageArray addObject:image];
//    }
//    带有图片的刷新
//    MJRefreshGifHeader *header = (MJRefreshGifHeader*)self.tableView.mj_header;
//    [header setImages:imageArray duration:1 forState:MJRefreshStateIdle];
//    [header setImages:imageArray duration:1 forState:MJRefreshStatePulling];
//    [header setImages:imageArray duration:1 forState:MJRefreshStateRefreshing];
 
  
    
}
-(void)loadNewData{
    
    NSString *urlString = @"http://sdxapp.com/api/geta.html?user_id=&act=GetIndexData&V=1.2.1&sign=a7036fb7a8feba662480c942&F=ios&mquan_id=556&key=14685721381405042202&cid=0";
  
 [Http NetWorkGETWithRequestURL:urlString WithPara:nil WithSuccessBlock:^(id returnValue) {
     
     NSMutableArray *dataArray = returnValue[@"data"];
  
     dispatch_async(dispatch_get_global_queue(0, 0), ^{

         for (int i = 0 ; i < dataArray.count; i++) {
             
             dispatch_async(dispatch_get_main_queue(), ^{
                  NSDictionary *dict = dataArray[i];
                  NSString *title = dict[@"title"];
                 if ( i == 0) {
                     
                     self.adArray = [DIYModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
                   
                     
                 }else if (i == 2){
                     
                     self.DIYArray = [DIYModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
                     [self createHeader];
                     
                 }else if ( i == 3){
                     
                     self.studyArray = [StudyModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
                     self.studyTitle = title;
                     
                 }else if (i == 5){
                     
                     self.foodArray = [DIYModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
                     self.foodTitle = title;
                     
                 }else if (i == 6){
                     
                     self.LatestArray = [NewModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
                     self.latestTitle = title;
                    
                     
                 }else if ( i == 7 ) {
                     
                     self.seeArray = [StudyModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
                      self.seeTitle = title;
                     
                     self.dataArray = [NSMutableArray arrayWithObjects:self.studyArray,self.foodArray,self.LatestArray,self.seeArray, nil];
                     self.titleArray = [NSMutableArray arrayWithObjects:self.studyTitle,self.foodTitle,self.latestTitle,self.seeTitle, nil];
                     if (self.dataArray.count > 0) {
                    
                         [self.activityDic stopAnimating];
                         [self.tableView.mj_header endRefreshing];
                         [self.tableView.mj_footer setHidden:NO];
                         [self.tableView reloadData];
                     }
                     
                 }
                 
                
             });

         }
         
     });
     
 } WithErroBlock:^(id erroCode) {
     
     
 } WithFailure:^(id error) {
   
     
     
 }];
    
    
}

-(void)loadMoreData{
    
    NSString *url = [NSString stringWithFormat:@"http://sdxapp.com/api/geta.html?user_id=&act=GetIndexMoreData&V=1.2.1&page=%ld&sign=48f87b983323070a7edde4cd&module_id=172&F=ios&mquan_id=556&key=14689956712363685659&data_from=index",(long)self.page];
    
    [Http NetWorkGETWithRequestURL:url WithPara:nil WithSuccessBlock:^(id returnValue) {
        NSDictionary *data = returnValue[@"data"];
        NSArray <StudyModel*> *array = [StudyModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
        [self.seeArray addObjectsFromArray:array];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
        
    } WithErroBlock:^(id erroCode) {
        
        
    } WithFailure:^(id error) {
        
        
    }];
    
    self.page ++;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 2)return  ([self.dataArray[section]count])/3 +1;
    
    return [self.dataArray[section]count]+1;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    if (indexPath.row == 0) {
        
        SystemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell forIndexPath:indexPath];
        
        cell.textLabel.text = self.titleArray[indexPath.section];
        return cell;
    
        
        
    }else{
        if (indexPath.section == 0 || indexPath.section ==3 ) {
            
            StudyModel *model = self.dataArray[indexPath.section][indexPath.row-1];
            if (model.img.count == 3) {
                MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MoreCell forIndexPath:indexPath];
                cell.model = model;
                return cell;
            }else{
                LitterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OnlyCell forIndexPath:indexPath];
                cell.model = model;
                return cell;
            }

            
        }else if (indexPath.section == 1){
           
            DIYModel *model = self.dataArray[indexPath.section][indexPath.row-1];
            FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FoodCell forIndexPath:indexPath];
 
            cell.model = model;
            return cell;
            
        }else{
            
            NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NewCell forIndexPath:indexPath];
            cell.dataArray = self.LatestArray;
            return cell;
            
        }
        
    }
   

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 15;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
    if (indexPath.row == 0){
        
        return 20;
    }else{
        if (indexPath.section == 0 || indexPath.section == 3) {
            
            NSMutableArray *array = self.dataArray[indexPath.section];
            StudyModel *model = array[indexPath.row-1];
            return model.cellHeight;
            
        }else{
            
            if (indexPath.section == 1) {
                
                DIYModel *model = self.dataArray[indexPath.section][indexPath.row-1];
            
                return model.cellHeight;
                
            }else{
                
                 return   (kWidth - 4*kOFF) /3.0 + 5.0 + 25.0;
                
            }
           
        }
       
        
    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailViewController *vc = [DetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma  mark 创建区头

-(void)createHeader{
    
    CGFloat height = 131.00*kWidth / 400;
    CGFloat height1 = 485.00*kWidth/1135;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, height+height1)];
    [self.view addSubview:view];
    NSMutableArray *imageArray = [NSMutableArray array];
    NSMutableArray *titleArray = [NSMutableArray array];
    
    for (int i = 0; i < self.adArray.count ; i++) {
        
        DIYModel *model = self.adArray[i];
         [imageArray addObject:model.img];
         [titleArray addObject:model.text];
    
    }
    
    SDCycleScrollView *sdcycle = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kWidth, height) delegate:nil placeholderImage:nil];;
    sdcycle.infiniteLoop = YES;
    sdcycle.titlesGroup = (NSArray*)titleArray;
    sdcycle.imageURLStringsGroup = imageArray;
    sdcycle.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    sdcycle.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [view addSubview:sdcycle];
    
    JSView *customview = [JSView viewFromXib];
    customview.frame = CGRectMake(0, height, kWidth,height1);
    for (int i = 0; i < self.DIYArray.count; i++) {
        DIYModel * model = self.DIYArray[i];
        customview.model = model;
    
    }
    [view addSubview:customview];
    [self.tableView setTableHeaderView:view];
    
    
    
    
    
}


@end
