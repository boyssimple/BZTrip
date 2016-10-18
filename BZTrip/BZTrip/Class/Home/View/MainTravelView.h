//
//  MainTravelView.h
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTravel.h"

@interface MainTravelView : UIView
- (void)updateData:(MainTravel*)travel;
+ (CGFloat)calHeight:(MainTravel*)travel;
@end
