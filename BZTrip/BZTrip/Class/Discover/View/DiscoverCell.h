//
//  DiscoverCell.h
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverCell : UITableViewCell
@property (nonatomic, strong) NSArray *array;
- (void)updateData;
+(CGFloat)calHeight;
@end
