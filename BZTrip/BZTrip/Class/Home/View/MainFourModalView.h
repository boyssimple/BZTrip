//
//  MainFourModalView.h
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainFourModalView : UIView
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UICollectionView *funcCollection;

+ (CGFloat)calHeight;

@end
