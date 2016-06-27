//
//  YFScaleView.h
//  滑动
//
//  Created by 孙云 on 16/6/27.
//  Copyright © 2016年 haidai. All rights reserved.
//
/**
 *  图片缩放的方法
 *
 *  @param nonatomic <#nonatomic description#>
 *  @param strong    <#strong description#>
 *
 *  @return <#return value description#>
 */
#import <UIKit/UIKit.h>

@interface YFScaleScrollViewView : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)UIImageView *imageView;//图片
@property(nonatomic,strong)UIScrollView *scaleScrollView;
@end
