//
//  CellLocNative.h
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellLocNative : UITableViewCell
@property (nonatomic, strong) NSMutableArray *dataSource;
+ (CGFloat)calHeight:(NSArray*)arr;
@end
