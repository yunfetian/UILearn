//
//  ViewController.m
//  UILearn
//
//  Created by 黄剛 on 2015/07/26.
//  Copyright (c) 2015年 黄剛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initView {
    UIView * uiView= [[UIView alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //button.center = CGPointMake(50, 20);
    button.frame = CGRectMake(20, 60, 50 ,30);
    [button setTitle:@"button" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    [button setBackgroundColor:[UIColor brownColor]];
    [button addTarget:self action:@selector(changLabel) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(90, 60, 50 ,30);
    [button1 setTitle:@"乘法表" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:10];
    [button1 setBackgroundColor:[UIColor brownColor]];
    [button1 addTarget:self action:@selector(setMultiplyTable) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button1];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(160, 60, 50 ,30);
    [button2 setTitle:@"随机数" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:10];
    [button2 setBackgroundColor:[UIColor brownColor]];
    [button2 addTarget:self action:@selector(createRandomLabel) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button2];
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(230, 60, 50 ,30);
    [button3 setTitle:@"视图" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:10];
    [button3 setBackgroundColor:[UIColor brownColor]];
    [button3 addTarget:self action:@selector(createViewAnimation) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button3];
    self.view = uiView;
    self.view.backgroundColor = [UIColor whiteColor];
}
// 通过输出一个乘法表完成对UILabel的学习
-(void) setMultiplyTable {
    UIView * uiView= [[UIView alloc] init];
    int x = 10;
    int y = 30;
    int weigth = 35;
    int height = 15;
    int weigthSpace = 5;
    int heightSpace = 10;
    for (int i = 1; i <= 9; i++) {
        for(int j = 1; j <= i; j++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x + (weigthSpace + weigth)*(j - 1), y + (heightSpace + height) * (i - 1), weigth, height)];
            label.text = [NSString stringWithFormat:@"%d * %d = %d",i,i + 1 - j,i*(i + 1 - j)];
            label.backgroundColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:6];
            [uiView addSubview:label];
        }
    }
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.center = CGPointMake(20, 300);
    [button1 setTitle:@"返回" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 sizeToFit];
    [button1 addTarget:self action:@selector(initView) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button1];
    self.view = uiView;
    self.view.backgroundColor = [UIColor whiteColor];
}

// 点击按钮后修改Label的背景色
-(void)changLabel{
    UIView * uiView= [[UIView alloc] init];
    // 使用viewWithTag方法可以获取指定的子控件
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    label.text = @"你吃我啊";
    label.backgroundColor = [UIColor yellowColor];
    label.tag = 111;
    [uiView addSubview:label];
    UILabel *label1 = (UILabel *)[self.view viewWithTag:111];
    label1.backgroundColor = [UIColor purpleColor];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.center = CGPointMake(20, 300);
    [button2 setTitle:@"返回" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 sizeToFit];
    [button2 addTarget:self action:@selector(initView) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button2];
    self.view = uiView;
    self.view.backgroundColor = [UIColor whiteColor];
}

// 点击next按钮后生成随机数
-(void)createRandomLabel{
    UIView * uiView= [[UIView alloc] init];
    // 生成十个高度一定，长度随机的标签
    int height = 20;
    int jiange = 10;
    int xLength = 30;
    int ylength = 50;
    int x = 200;
    for (int i = 0; i <= 9; i++) {
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(xLength, ylength + (jiange+height)*i, 40, height)];
        label1.text = [[NSString alloc] initWithFormat:@"%d",i + 1 ];
        label1.textColor = [UIColor redColor];
        [uiView addSubview:label1];
        int weigth = arc4random() % x;
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(xLength+40, ylength + (jiange+height)*i, weigth, height)];
        label.backgroundColor = [UIColor blueColor];
        [uiView addSubview:label];
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.center = CGPointMake(100, 400);
    [button setTitle:@"next" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button sizeToFit];
    [button addTarget:self action:@selector(createRandomLabel) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.center = CGPointMake(160, 400);
    [button2 setTitle:@"返回" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 sizeToFit];
    [button2 addTarget:self action:@selector(initView) forControlEvents:UIControlEventTouchUpInside];
    [uiView addSubview:button2];
    self.view = uiView;
    self.view.backgroundColor = [UIColor whiteColor];
}
// 试图和动画的学习
-(void) createViewAnimation {
    // 画像を表示する
    UIView *view = [[UIView alloc] init];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.center = CGPointMake(160, 240);
    [view addSubview:imageView];
    
    // アニメーション
    [UIView animateWithDuration:2.5f // アニメーション速度2.5秒
                          delay:1.0f // 1秒後にアニメーション
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         // 画像を2倍に拡大
                         imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
                         
                     } completion:^(BOOL finished) {
                         [self initView];
                     }];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.center = CGPointMake(160, 500);
    [button2 setTitle:@"返回" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 sizeToFit];
    [button2 addTarget:self action:@selector(initView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button2];
    self.view = view;
    self.view.backgroundColor = [UIColor whiteColor];
}
@end
