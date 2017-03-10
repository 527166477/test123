//
//  JJOneController.m
//  自定义tabar中间按钮
//
//  Created by JJ on 15/11/7.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import "JJOneController.h"
#import "MyView.h"
#import "JJTwoViewController.h"
#import "JJThreeViewController.h"
#import "JJFourViewController.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface JJOneController ()<MyViewDeletage,UIScrollViewDelegate>

@property (nonatomic) NSMutableArray *array;
@property (nonatomic) UIScrollView *textScroll;
@property (nonatomic) UIScrollView *viewScroll;
@property (nonatomic) UIImageView *imageBackView;

@end

@implementation JJOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MyView *myView = [[MyView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40) withWidth:20 withArray:nil];
    myView.delegate = self;
    self.navigationItem.titleView = myView;
    _array = [[NSMutableArray alloc] init];
    self.view.backgroundColor=[UIColor greenColor];
}

- (void)navButtonClick:(UIButton *)button {
    NSLog(@"点击了%li",button.tag);
    if(button.tag == 1) {
        [_viewScroll removeFromSuperview];
        [_textScroll removeFromSuperview];
        [self addScrollView];


    } else if(button.tag == 2) {
        [_viewScroll removeFromSuperview];
        [_textScroll removeFromSuperview];
        if(_viewScroll != 0) {
            NSLog(@"测试");
        }
    }

}

//添加两个ScrollView
- (void)addScrollView {
    _textScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, ScreenW, 30)];
    _textScroll.contentSize = CGSizeMake(480, 30);//设置实际大小
    //关闭水平导航条
    _textScroll.showsHorizontalScrollIndicator = NO;
    _textScroll.showsVerticalScrollIndicator = NO;
    //添加按钮的背景图片
    _imageBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5,80, 30)];
    _imageBackView.image = [UIImage imageNamed:@"b1"];
    self.imageBackView.backgroundColor = [UIColor whiteColor];
    self.imageBackView.userInteractionEnabled = YES;
    [_textScroll addSubview:self.imageBackView];
    //添加Button
    for (int i = 0; i<6; i++) {
        UIButton *view = [[UIButton alloc] initWithFrame:CGRectMake(80*i, 0, 80, 30)];
        NSString *text = [NSString stringWithFormat:@"我是%i",i];
        [view setTitle:text forState:UIControlStateNormal];
        [view addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        view.tag = i;
        [view setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.textScroll addSubview:view];
    }
    
    [self.view addSubview:_textScroll];
    
    _viewScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, ScreenW, 400)];
    _viewScroll.contentSize = CGSizeMake(ScreenW*6,400);
    UIViewController *vc1 = [[UIViewController alloc] init];
    //添加View
    vc1.view.backgroundColor = [UIColor grayColor];
    [_viewScroll addSubview:vc1.view];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor whiteColor];
    CGRect frame = vc2.view.frame;
    frame.origin.x = frame.size.width;
    vc2.view.frame = frame;
    [_viewScroll addSubview:vc2.view];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blackColor];
    frame = vc3.view.frame;
    frame.origin.x = frame.size.width*2;
    vc3.view.frame = frame;
    [_viewScroll addSubview:vc3.view];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor redColor];
    frame = vc4.view.frame;
    frame.origin.x = frame.size.width*3;
    vc4.view.frame = frame;
    [_viewScroll addSubview:vc4.view];
    
    JJTwoViewController *vc5 = [[JJTwoViewController alloc] init];
    frame = vc5.view.frame;
    frame.origin.x = frame.size.width*4;
    vc5.view.frame = frame;
    [_viewScroll addSubview:vc5.view];
    
    JJFourViewController *vc6 = [[JJFourViewController alloc] init];
    frame = vc6.view.frame;
    frame.origin.x = frame.size.width*5;
    vc6.view.frame = frame;
    [_viewScroll addSubview:vc6.view];
    
    _viewScroll.pagingEnabled = YES;
    _viewScroll.showsVerticalScrollIndicator = NO;
    _viewScroll.showsHorizontalScrollIndicator = NO;
    _viewScroll.delegate = self;
    
    [self.view addSubview:_viewScroll];


}

- (void)buttonClick:(UIButton *)button {
    NSInteger i = button.tag;
    _viewScroll.contentOffset = CGPointMake(ScreenW*i, 0);
    CGRect frame = _imageBackView.frame;
    frame.origin.x = _imageBackView.bounds.size.width *i;
    _imageBackView.frame = frame;
    NSInteger j = i - 2;
    if(j < 0) {
        j = 0;
    }
    _textScroll.contentOffset = CGPointMake(80*j, 0);
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger i = scrollView.contentOffset.x/ScreenW;
    NSInteger j = i - 2;
    if(j < 0) {
        j = 0;
    }
    _textScroll.contentOffset = CGPointMake(80*j, 0);
    CGRect frame = _imageBackView.frame;
    frame.origin.x = _imageBackView.bounds.size.width *i;
    _imageBackView.frame = frame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
