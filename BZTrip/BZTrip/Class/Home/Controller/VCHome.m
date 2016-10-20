//
//  VCHome.m
//  BZTrip
//
//  Created by zhouMR on 16/10/9.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCHome.h"
#import "ADPCollectionView.h"
#import "MainFunc.h"
#import "MainCollectionView.h"
#import "MainFourModalView.h"
#import "MainTravelView.h"
#import "MainTravel.h"

#define SCROLLVIEW_HEIGHT 160

@interface VCHome ()
@property (nonatomic, strong) UIScrollView *mainScroll;
@property (nonatomic, strong) MainCollectionView *mainFunc;
@property (nonatomic, strong) MainFourModalView *mainFourCollec;
@property (nonatomic, strong) MainTravelView *mainTravelView;
@end

@implementation VCHome

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    //初始化mainScroll
    [self.view addSubview:self.mainScroll];
    
    //滚动图
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=1; i<5; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"s%d.jpg",i]];
        [arr addObject:img];
    }
    [ADPCollectionView collectionViewWithFrame:CGRectMake(0, 0, DEVICEWIDTH, SCROLLVIEW_HEIGHT)
                                    imageArray:arr
                                     Direction:UICollectionViewScrollDirectionHorizontal
                                  timeInterval:5
                                          view:self.mainScroll];
    
    //顶部功能区
    NSMutableArray *funcArr = [NSMutableArray array];
    for (int i=0; i<8; i++) {
        MainFunc *func = [[MainFunc alloc]init];
        func.img = [NSString stringWithFormat:@"Main_Icon_0%d",i+1];
        if (i == 0) {
            func.text = @"景区门票";
        }else if (i == 1) {
            func.text = @"出境游";
        }else if (i == 2) {
            func.text = @"国内游";
        }else if (i == 3) {
            func.text = @"度假酒店";
        }else if (i == 4) {
            func.text = @"周边游";
        }else if (i == 5) {
            func.text = @"民宿预定";
        }else if (i == 6) {
            func.text = @"当地特产";
        }else if (i == 7) {
            func.text = @"低价疯抢";
        }
        [funcArr addObject:func];
    }
    self.mainFunc.dataSource = funcArr;
    [self.mainFunc.funcCollection reloadData];
    [self.mainScroll addSubview:self.mainFunc];
    
    //顶部4块区
    NSMutableArray *fourFuncArr = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        [fourFuncArr addObject:[NSString stringWithFormat:@"Main_Theme_0%d",i+1]];
    }
    self.mainFourCollec.dataSource = fourFuncArr;
    [self.mainScroll addSubview:self.mainFourCollec];
    
    //低部主题
    MainTravel *travel = [[MainTravel alloc]init];
    travel.img = @"Main_Theme_05";
    travel.title = @"四川巴中光雾山十八月7日游";
    travel.shareBack = @"￥5";
    travel.shareCount = 1200;
    travel.desc = @"光雾山景区，4A级景区景区，4A级景区景区，4A级景区景区，4A级景区景区，4A级景区景区，4A级景区";
    [self.mainTravelView updateData:travel];
    [self.mainScroll addSubview:self.mainTravelView];
    _mainScroll.contentSize = CGSizeMake(_mainScroll.contentSize.width, self.mainTravelView.top);
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (UIScrollView*)mainScroll{
    if (!_mainScroll) {
        _mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -20, DEVICEWIDTH, DEVICEHEIGHT+20)];
    }
    return _mainScroll;
}

- (MainCollectionView*)mainFunc{
    if (!_mainFunc) {
        _mainFunc = [[MainCollectionView alloc]initWithFrame:CGRectMake(0, SCROLLVIEW_HEIGHT, DEVICEWIDTH, [MainCollectionView calHeight])];
    }
    return _mainFunc;
}

- (MainFourModalView*)mainFourCollec{
    if (!_mainFourCollec) {
        _mainFourCollec = [[MainFourModalView alloc]initWithFrame:CGRectMake(0, self.mainFunc.top, DEVICEWIDTH, [MainFourModalView calHeight])];
    }
    return _mainFourCollec;
}

- (MainTravelView*)mainTravelView{
    if (!_mainTravelView) {
        MainTravel *travel = [[MainTravel alloc]init];
        travel.title = @"四川巴中光雾山十八月7日游";
        travel.desc = @"光雾山景区，4A级景区景区，4A级景区景区，4A级景区景区，4A级景区景区，4A级景区景区，4A级景区";
        _mainTravelView = [[MainTravelView alloc]initWithFrame:CGRectMake(0, self.mainFourCollec.top, DEVICEWIDTH, [MainTravelView calHeight:travel])];
    }
    return _mainTravelView;
}

@end
