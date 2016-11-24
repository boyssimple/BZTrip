//
//  HeaderLocNative.h
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderLocNative : UIView
@property (nonatomic, strong) NSMutableArray *dataSource;
- (void)updateData;
+ (CGFloat)calHeight:(NSArray*)arr;
@end
