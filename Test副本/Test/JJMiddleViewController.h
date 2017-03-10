//
//  JJMiddleViewController.h
//  自定义tabar中间按钮
//
//  Created by JJ on 15/11/7.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JJMiddleDelegate <NSObject>

- (void)buttonClick:(UIButton *)button;

@end

@interface JJMiddleViewController : UIViewController

@property(weak,nonatomic) id<JJMiddleDelegate> delegate;

@end
