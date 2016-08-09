//
//  NextViewController.m
//  UITextField限制个数
//
//  Created by miya on 16/8/9.
//  Copyright © 2016年 miya. All rights reserved.
//

#import "NextViewController.h"
#import <Masonry.h>
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self createUI];
}

- (void)createUI{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.tag = 100;
    label.text = @"限制个数6个";
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(100);
    }];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 90, 40)];
    [btn setTitle:@"传值" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(label.mas_bottom).offset(100);
    }];
}
- (void)btnClick:(UIButton *)btn{
    UILabel * label = (UILabel *)[self.view viewWithTag:100];
    self.myBlock(label.text);
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
