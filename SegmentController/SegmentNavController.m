//
//  SegmentNavController.m
//  SegmentController
//
//  Created by epwk on 16/7/14.
//  Copyright © 2016年 Epwk. All rights reserved.
//

#import "SegmentNavController.h"
#import "SegmentHeaderView.h"
#import "SegmentDetailView.h"

#define kBarHeight 35
#define kViewWith [UIScreen mainScreen].bounds.size.width
#define kViewHeight [UIScreen mainScreen].bounds.size.height

@interface SegmentNavController ()<SegmentIndexDelegate>
{
    int currentIndex;
    NSArray *_titleArray;
    SegmentDetailView *scrollView;
    SegmentHeaderView *barView ;
}
@end

@implementation SegmentNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [_titleArray objectAtIndex:0];
}

-(id)initWithItems:(NSArray*)titleArray andControllers:(NSArray*)controllers
{
    self = [super init];
    if (self)
    {
        int y = 0;
        if([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
        {
            self.automaticallyAdjustsScrollViewInsets = NO;
            y = 64;
        }
        
        
        barView = [[SegmentHeaderView alloc]initWithFrame:CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, kBarHeight) andItems:titleArray];
        barView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:barView];
        barView.clickDelegate = self;
        
        
        self.view.backgroundColor = [UIColor whiteColor];
        scrollView = [[SegmentDetailView alloc]initWithFrame:CGRectMake(0,  kBarHeight + y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - kBarHeight - y) ControllerArray:controllers];
        scrollView.swipeDelegate = self;
        [self.view addSubview:scrollView];
        
        
        currentIndex = 0;
        
//        if (controllers.count > 0)
//        {
//            for (UIViewController *controller  in controllers)
//            {
//                [self addChildViewController:controller];
//            }
//        }
        _titleArray = titleArray;
    }
    return self;
}


-(void)barSelectedIndexChanged:(int)newIndex
{
    if (newIndex >= 0)
    {
        currentIndex = newIndex;
        self.title = [_titleArray objectAtIndex:newIndex];
        [scrollView selectIndex:newIndex];
    }
}

-(void)contentSelectedIndexChanged:(int)newIndex
{
    [barView selectIndex:newIndex];
}

-(void)scrollOffsetChanged:(CGPoint)offset
{
    int page = (int)offset.x / [UIScreen mainScreen].bounds.size.width ;
    float radio = (float)((int)offset.x % (int)kViewWith)/kViewWith;
    [barView setLineOffsetWithPage:page andRatio:radio];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
