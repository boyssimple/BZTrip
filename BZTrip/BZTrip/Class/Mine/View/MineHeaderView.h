//
//  MineHeaderView.h
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MineHeaderViewDelegate ;
@interface MineHeaderView : UIView
@property (nonatomic, assign) id<MineHeaderViewDelegate> delegate;
- (void)updateData;
+ (CGFloat)calHeight;
@end

@protocol MineHeaderViewDelegate <NSObject>

- (void)loginActin;

@end
