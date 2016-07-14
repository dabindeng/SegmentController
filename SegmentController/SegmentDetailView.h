//
//  SegmentDetailView.h
//  SegmentController
//
//  Created by epwk on 16/7/14.
//  Copyright © 2016年 Epwk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentHeaderView.h"

@interface SegmentDetailView : UIScrollView<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

- (id)initWithFrame:(CGRect)frame ControllerArray:(NSArray*)ControllerArray;
-(void)selectIndex:(int)index;

@property(nonatomic,unsafe_unretained)id<SegmentIndexDelegate>swipeDelegate;

@end
