//
//  YFScrollView.m
//  滑动
//
//  Created by 孙云 on 16/6/27.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "YFScrollView.h"
#import "YFScaleScrollViewView.h"
static int const K_TAG = 1000;
@interface YFScrollView()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;//滑动
@end
@implementation YFScrollView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame: frame];
    if (self) {
        
    }
    return self;
}
/**
 *  设置
 */
- (void)setScrollView{

    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self addSubview:self.scrollView];
    
    //图片设置
    for(int i = 0;i < self.dataArray.count;i ++){
    
        YFScaleScrollViewView *scaleView = [[YFScaleScrollViewView alloc]initWithFrame:CGRectMake(i *self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        scaleView.tag = i + K_TAG;
        scaleView.imageView.image = [UIImage imageNamed:self.dataArray[i]];

        [self.scrollView addSubview:scaleView];
    }
    [self.scrollView setContentSize:CGSizeMake(self.dataArray.count * self.frame.size.width, 0)];
}
/**
 *  set方法
 *
 */
- (void)setDataArray:(NSArray *)dataArray{

    _dataArray = dataArray;
    //设置
    [self setScrollView];
}
/**
 *  判断滑动到的这一页的图片是否处于放大状态，若是缩小为正常
 *
 *  @param scrollView <#scrollView description#>
 */
int lastIndex = 0;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int indexs = _scrollView.contentOffset.x / self.frame.size.width;
    YFScaleScrollViewView *scaleView = (YFScaleScrollViewView *)[_scrollView viewWithTag:indexs + K_TAG];
    if (indexs != lastIndex && scaleView.scaleScrollView.zoomScale > 1.0) {
        [scaleView.scaleScrollView setZoomScale:1.0 animated:YES];
    }
    lastIndex = indexs;
}
@end
