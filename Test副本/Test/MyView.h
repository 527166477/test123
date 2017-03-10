//
//  MyView.h
//  自定义tabar中间按钮
//
//  Created by yiruit on 17/3/7.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyViewDeletage <NSObject>

- (void)navButtonClick:(UIButton *)button;

@end

@interface MyView : UIView
@property (nonatomic) UIButton *button1;

@property (weak,nonatomic)id<MyViewDeletage> delegate;

- (instancetype)initWithFrame:(CGRect)frame withWidth:(CGFloat)width withArray:(NSArray *)ar;

@end
