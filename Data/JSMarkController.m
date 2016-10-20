//
//  JSMarkController.m
//  TextData
//
//  Created by Aisino on 16/7/18.
//  Copyright © 2016年 Aisino. All rights reserved.
//

#import "JSMarkController.h"
#import "ImageTableViewCell.h"
#import "SystemTableViewCell.h"
#import "MarkMoreTableViewCell.h"
@interface JSMarkController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
/**子标题等信息的字典*/
@property (nonatomic, strong) NSDictionary *dict;
/**广告图片的数组*/
@property (nonatomic, strong) NSMutableArray <MarkModel*>*bannerArray;
/**图文详情的数组*/
@property (nonatomic, strong) NSMutableArray <MarkModel*>*contentArray;
/**推荐的数组*/
@property (nonatomic, strong) NSMutableArray <MarkModel*>*recommendArray;
/**滑动视图*/
@property (nonatomic, strong) UIScrollView *scrollView;
/**配套的原点*/
@property (nonatomic, strong) UIPageControl *pageControl;
/**当前的页数*/
@property (nonatomic, assign) NSInteger currentPage;
/**子标题的控件*/
@property (nonatomic, strong) UILabel *titleLabel;
/**子标题的高度*/
@property (nonatomic, assign) CGFloat height;
/**已售的控件*/
@property (nonatomic, strong) UILabel *sellLabel;
/**原价的控件*/
@property (nonatomic, strong) UILabel *priceLabel;
@end

@implementation JSMarkController

-(NSMutableArray*)dataArray{
    
    return OALazy(_dataArray, [NSMutableArray array]);
    
}

static NSString *const CellID = @"image";
static NSString *const CustomCell = @"cell";
static NSString *const MarkCell = @"mark";
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self SetUp];
    [self loadData];

}

-(void)SetUp{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageTableViewCell class]) bundle:nil] forCellReuseIdentifier:CellID];
     [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SystemTableViewCell class]) bundle:nil] forCellReuseIdentifier:CustomCell];
    [self.tableView registerClass:[MarkMoreTableViewCell class] forCellReuseIdentifier:MarkCell];
    self.tableView.backgroundColor = [UIColor whiteColor];
    //第一种方法
//    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    
}

-(void)loadData{

    self.tableView.mj_header = [JSMJHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    if (self.dict.count == 0) {
        
        [self loadNewData];
      
    }
    

}

-(void)loadNewData{
    
    NSString *url = @"http://sdxapp.com/shopapi/ShopGet.html?user_id=&act=GetGMsg&V=1.2.1&sign=a58a90e2fa20dfe67ccae02a&g_id=1616&F=ios&mquan_id=556&key=14690002694273655901";
    
    [Http NetWorkGETWithRequestURL:url WithPara:nil WithSuccessBlock:^(id returnValue) {
       
        NSDictionary *dict = returnValue[@"data"];
        self.dict = dict;
        self.navigationItem.title = dict[@"title"];
        self.bannerArray = [MarkModel mj_objectArrayWithKeyValuesArray:dict[@"banner"]];
        self.contentArray = [MarkModel mj_objectArrayWithKeyValuesArray:dict[@"content"]];
        self.recommendArray = [MarkModel mj_objectArrayWithKeyValuesArray:dict[@"recommend"]];
        [self createHeader];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
        
    } WithErroBlock:^(id erroCode) {
        
    } WithFailure:^(id error) {
        
        
    }];
    
    
}

#pragma  mark tableView的代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
        
    }else if (section == 1){
        
        return self.contentArray.count+1;
        
    }else{
        
        return 2;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 || (indexPath.section ==1 && indexPath.row == 0) || (indexPath.section ==2 && indexPath.row == 0)) {
        SystemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCell forIndexPath:indexPath];
        NSArray *array = @[@"选择款式",@"图文详情",@"相关推荐"];
        cell.textLabel.text = array[indexPath.section];
        return  cell;
        
    }else if(indexPath.section ==1){
        
        ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
        
        if (indexPath.row != 0) {
            MarkModel *model = self.contentArray[indexPath.row-1];
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.img_url]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        }
        
        return cell;
    }else{
        
        MarkMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MarkCell forIndexPath:indexPath];

          if (indexPath.row != 0) {
               cell.row = indexPath.row;
              cell.dataArray = self.recommendArray;
              
              
          }
        
        return cell;
    }
  
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 0.1)];
    view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    return view;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    // 0.0001 第一个区
    return  0.1;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return 0.0001;
//    }else{
//        return 15;
//    }
//    
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 30;
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) return 30;
        return kWidth*400/600.0;
        
    }else{
        
        if (indexPath.row == 0) return 30;
        return (kWidth -30)/2.0+15 +20 +((kWidth -30)/2.0+30)*(self.recommendArray.count / 2);
        
    }
    
}

-(void)createHeader{
  CGSize size = [self.dict[@"subtitle"] boundingRectWithSize:CGSizeMake(kWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14] } context:nil].size;
    self.height = size.height;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 300 + size.height + 20 + 20)];
    [self.tableView setTableHeaderView:view];
    [view addSubview:self.scrollView];
    [view addSubview:self.pageControl];
    [view addSubview:self.titleLabel];
    [view addSubview:self.sellLabel];
    [view addSubview:self.priceLabel];
    
    
}

#pragma  mark 创建滑动视图
-(UIScrollView*)scrollView{
    
    if (_scrollView == nil) {
    
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0, 0, kWidth, 300);
        _scrollView.contentSize = CGSizeMake(self.bannerArray.count*kWidth, 0);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        for (int i = 0; i < self.bannerArray.count; i++) {
            MarkModel *model = self.bannerArray[i];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake(kWidth*i, 0, kWidth, _scrollView.height);
            [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.img_url]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
            [_scrollView addSubview:imageView];
            imageView.userInteractionEnabled = YES;
            
        }
        _scrollView.delegate = self;
        
        
    }
    return _scrollView;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offx = self.scrollView.contentOffset.x;
    self.currentPage = offx / kWidth;
    self.pageControl.currentPage = self.currentPage;
}
-(UIPageControl*)pageControl{
    
    if (_pageControl == nil) {
        
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.bounds = CGRectMake(0, 0, kWidth, 8);
        _pageControl.center = CGPointMake(kWidth/ 2.0, _scrollView.height - 8);
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.numberOfPages = self.bannerArray.count;
        [_pageControl addTarget:self action:@selector(pageBtn) forControlEvents:UIControlEventValueChanged];
        
    }
    
    return _pageControl;
    
}

-(void)pageBtn{
    
    self.currentPage = self.pageControl.currentPage;
    [self.scrollView setContentOffset:CGPointMake(kWidth*self.currentPage, 0) animated:YES];
    
}

-(UILabel*)titleLabel{
    
    if (_titleLabel == nil) {
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.frame = CGRectMake(10, self.scrollView.bottom +5, kWidth, self.height);
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = self.dict[@"subtitle"];
        UILabel *sellLabel = [[UILabel alloc]init];
        sellLabel.frame = CGRectMake(10, _titleLabel.bottom + 5, kWidth, 10);
        sellLabel.font = [UIFont systemFontOfSize:12];
        sellLabel.textColor = [UIColor lightGrayColor];
        sellLabel.text = [NSString stringWithFormat:@"%@",self.dict[@"sale"]];
        self.sellLabel = sellLabel;
        
        
    }
    return  _titleLabel;
}

-(UILabel*)priceLabel{
    
    if (_priceLabel == nil) {
        
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.frame = CGRectMake(10, _sellLabel.bottom + 5, kWidth, 10);
        NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:self.dict[@"oprice"] attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:12],NSForegroundColorAttributeName :[UIColor lightGrayColor],NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle |NSUnderlinePatternSolid),NSStrikethroughColorAttributeName:[UIColor lightGrayColor]}];
        _priceLabel.attributedText = attrStr;
        
    }
    return _priceLabel;
}
@end
