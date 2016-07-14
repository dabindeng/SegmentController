//
//  SegmentDetailView.m
//  SegmentController
//
//  Created by epwk on 16/7/14.
//  Copyright © 2016年 Epwk. All rights reserved.
//

#import "SegmentDetailView.h"

#define kViewWith [UIScreen mainScreen].bounds.size.width
#define kViewHeight [UIScreen mainScreen].bounds.size.height

@implementation SegmentDetailView

@synthesize swipeDelegate;


- (id)initWithFrame:(CGRect)frame ControllerArray:(NSArray*)ControllerArray
{
    self = [super init];
    if (self)
    {
        self.frame = frame;
        
        self.backgroundColor = [UIColor lightGrayColor];
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.bounces =YES;
        [self addSubview:_scrollView];
        
        for (int i = 0; i < ControllerArray.count; i++) {
            UIView *view = [ControllerArray[i] view];
            view.frame = CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
            [_scrollView addSubview:view];
        }
        
        [_scrollView setContentSize:CGSizeMake(frame.size.width*ControllerArray.count, frame.size.height)];
        
    }
    return self;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.swipeDelegate != nil && [self.swipeDelegate respondsToSelector:@selector(contentSelectedIndexChanged:)])
    {
        int index = _scrollView.contentOffset.x / kViewWith;
        [self.swipeDelegate contentSelectedIndexChanged:index];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint pt =   _scrollView.contentOffset;
    [self.swipeDelegate scrollOffsetChanged:pt];
}

-(void)selectIndex:(int)index
{
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width*index, 0) animated:YES];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
