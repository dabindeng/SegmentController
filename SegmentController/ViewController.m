//
//  ViewController.m
//  SegmentController
//
//  Created by epwk on 16/7/14.
//  Copyright © 2016年 Epwk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 35)];
    _label.text = self.title;
    _label.textColor = [UIColor blackColor];
    [self.view addSubview:_label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
