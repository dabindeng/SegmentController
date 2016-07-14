//
//  SegmentHeaderView.h
//  SegmentController
//
//  Created by epwk on 16/7/14.
//  Copyright © 2016年 Epwk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentIndexDelegate <NSObject>

@optional
-(void)barSelectedIndexChanged:(int)newIndex;
-(void)contentSelectedIndexChanged:(int)newIndex;
-(void)scrollOffsetChanged:(CGPoint)offset;

@end

@interface SegmentHeaderView : UIScrollView

-(id)initWithFrame:(CGRect)frame andItems:(NSArray*)titleArray;
-(void)setLineOffsetWithPage:(float)page andRatio:(float)ratio;
-(void)selectIndex:(int)index;
@property(nonatomic,assign)int selectedIndex;
@property(nonatomic,unsafe_unretained)id<SegmentIndexDelegate>clickDelegate;



@end
