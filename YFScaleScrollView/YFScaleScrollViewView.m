//
//  YFScaleView.m
//  滑动
//
//  Created by 孙云 on 16/6/27.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "YFScaleScrollViewView.h"

@implementation YFScaleScrollViewView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //缩放用的scrollview
        self.scaleScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        self.scaleScrollView.delegate = self;
        self.scaleScrollView.minimumZoomScale = 0.5;
        self.scaleScrollView.maximumZoomScale = 2.0;
        self.scaleScrollView.showsVerticalScrollIndicator = NO;
        self.scaleScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scaleScrollView];
        //显示的图片
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.imageView.userInteractionEnabled = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scaleScrollView addSubview:self.imageView];
        //点击放大事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeScale:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}
/**
 *  缩放的视图
 *
 *  @param scrollView <#scrollView description#>
 *
 *  @return <#return value description#>
 */
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return self.imageView;
}
/**
 *  点击方法
 *
 *  @param sender <#sender description#>
 */
- (void)changeScale:(UITapGestureRecognizer *)sender{

    //缩放
    if (self.scaleScrollView.zoomScale >= 2.0) {
        self.scaleScrollView.zoomScale = 1.0;
    }else{
    
        CGPoint point = [sender locationInView:self];
        [self.scaleScrollView zoomToRect:CGRectMake(point.x - 40, point.y - 40, 80, 80) animated:YES];
    }
}
@end
