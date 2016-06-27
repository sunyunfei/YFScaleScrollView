//
//  ViewController.m
//  滑动
//
//  Created by 孙云 on 16/6/27.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "YFScrollView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YFScrollView *scr = [[YFScrollView alloc]initWithFrame:self.view.bounds];
    scr.dataArray = @[@"1.jpg",@"2",@"3.jpg"];
    [self.view addSubview:scr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
