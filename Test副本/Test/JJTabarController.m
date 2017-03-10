//
//  JJTabarController.m
//  自定义tabar中间按钮
//
//  Created by JJ on 15/11/7.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJTabarController.h"
#import "JJOneController.h"
#import "JJTwoViewController.h"
#import "JJThreeViewController.h"
#import "JJFourViewController.h"
#import "JJMiddleViewController.h"
#import "SlideHeadView.h"
#import "MyView.h"

@interface JJTabarController ()<JJMiddleDelegate,MyViewDeletage>
@property(nonatomic,strong) JJMiddleViewController *middle;
@end

@implementation JJTabarController
- (void)viewDidLoad {
    [super viewDidLoad];
    JJOneController *first = [[JJOneController alloc] init];
    UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:first];
        nvc1.tabBarItem.title = @"首页";
    
    JJTwoViewController *second = [[JJTwoViewController alloc] init];
    UINavigationController *nvc2 = [[UINavigationController alloc] initWithRootViewController:second];
    nvc2.tabBarItem.title = @"动态";
    
    self.middle = [[JJMiddleViewController alloc] init];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 15;
    btn.backgroundColor=[UIColor redColor];
    btn.frame=CGRectMake(0, 0, 30, 30);
    btn.center=self.tabBar.center;
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    JJThreeViewController *third = [[JJThreeViewController alloc] init];
     UINavigationController *nvc3 = [[UINavigationController alloc] initWithRootViewController:third];
    nvc3.tabBarItem.title = @"广场";
    
    JJFourViewController *four = [[JJFourViewController alloc] init];
    UINavigationController *nvc4 = [[UINavigationController alloc] initWithRootViewController:four];
    nvc4.tabBarItem.title = @"我的";

    self.viewControllers = @[nvc1,nvc2,self.middle,nvc3,nvc4];
    
}

- (void)click{
    JJMiddleViewController *md = [[JJMiddleViewController alloc] init];
    md.delegate = self;
    [self presentViewController:md animated:YES completion:nil];
    //    self.tabBar.hidden = YES;
    //    self.selectedViewController=self.middle;
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
