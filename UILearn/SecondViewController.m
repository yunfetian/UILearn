//
//  SecondViewController.m
//  UILearn
//
//  Created by 黄剛 on 2015/07/30.
//  Copyright (c) 2015年 黄剛. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()
- (IBAction)ReturnToFirstView:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    NSArray *array = [[NSArray alloc] initWithObjects:@"美女",@"帅哥", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
    segmentedControl.frame = CGRectMake(35, 100, 250, 30);
    [segmentedControl addTarget:self action:@selector(mySegmentControlAction:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 1;
    
    [self.view addSubview:segmentedControl];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)mySegmentControlAction:(UISegmentedControl *)segment
{
    if(segment.selectedSegmentIndex == 0)
    {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了美女" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
    } else if (segment.selectedSegmentIndex == 1) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了帅哥" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
    }
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

- (IBAction)ReturnToFirstView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
