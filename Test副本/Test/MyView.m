//
//  MyView.m
//  自定义tabar中间按钮
//
//  Created by yiruit on 17/3/7.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame withWidth:(CGFloat)width withArray:(NSArray *)ar {
    self = [super initWithFrame:frame];
    if(self) {
        _button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_button1 setTitle:@"你好" forState:UIControlStateNormal];
        _button1.frame = CGRectMake(0, 0, self.bounds.size.width/3, 30);
        _button1.backgroundColor = [UIColor whiteColor];
        [_button1 addTarget:self action:@selector(buttongClick:) forControlEvents:UIControlEventTouchUpInside];
        _button1.tag = 1;
        [self addSubview:_button1];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button2 setTitle:@"很好" forState:UIControlStateNormal];
        button2.frame = CGRectMake(self.bounds.size.width/3, 0, self.bounds.size.width/3, 30);
        [button2 addTarget:self action:@selector(buttongClick:) forControlEvents:UIControlEventTouchUpInside];
        button2.tag = 2;
        button2.backgroundColor = [UIColor redColor];
        [self addSubview:button2];
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button3 setTitle:@"更多" forState:UIControlStateNormal];
        button3.frame = CGRectMake(self.bounds.size.width/3*2, 0, self.bounds.size.width/3, 30);
        [button3 addTarget:self action:@selector(buttongClick:) forControlEvents:UIControlEventTouchUpInside];
        button3.tag = 3;
        button3.backgroundColor = [UIColor blueColor];
        [self addSubview:button3];
    }
    return self;
}

- (void)buttongClick:(UIButton *)button {
    if([self.delegate respondsToSelector:@selector(navButtonClick:)]) {
        [self.delegate navButtonClick:button];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
