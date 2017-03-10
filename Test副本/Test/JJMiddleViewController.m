//
//  JJMiddleViewController.m
//  自定义tabar中间按钮
//
//  Created by JJ on 15/11/7.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJMiddleViewController.h"

@interface JJMiddleViewController ()

@end

@implementation JJMiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 15;
    btn.backgroundColor=[UIColor redColor];
    btn.tag = 415;
    btn.frame=CGRectMake(self.view.bounds.size.width/2,200, 30, 30);
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.view.backgroundColor=[UIColor grayColor];
}

- (void)click:(UIButton *)button {
    if([self.delegate respondsToSelector:@selector(buttonClick:)]) {
        [self.delegate buttonClick:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
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
