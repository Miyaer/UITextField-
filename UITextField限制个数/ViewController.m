//
//  ViewController.m
//  UITextField限制个数
//
//  Created by miya on 16/8/3.
//  Copyright © 2016年 miya. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "NextViewController.h"
@interface ViewController ()<UITextFieldDelegate>
{
    UITextField * _myTF;
    UIImageView * _imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createImageViewForMasonry];
    [self createUI];
}
- (void)createUI{
    _myTF = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    _myTF.center = self.view.center;
    _myTF.backgroundColor = [UIColor lightGrayColor];
    _myTF.clearButtonMode = YES;
   // [_myTF addTarget:self action:@selector(TextFileChange:) forControlEvents:UIControlEventEditingChanged];
    _myTF.delegate = self;
    [_imageView addSubview:_myTF];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(100, 20, 500, 20);
    [_myTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_imageView).with.insets(padding);
    }];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:btn];

    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.top.equalTo(_myTF.mas_bottom).offset(50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
}
- (void)btnClick:(UIButton *)btn{
    NextViewController * nvc = [[NextViewController alloc]init];
    nvc.myBlock = ^(NSString *str){
        _myTF.text = str;
    };
    [self presentViewController:nvc animated:YES completion:nil];
}
- (void)createImageViewForMasonry{
    
    _imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];

    UIEdgeInsets padding = UIEdgeInsetsMake(20, 0,0, 0);
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    UITextRange * selectedRange = [textField markedTextRange];
    //获取高亮部分
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    if (!position) {
        if (_myTF.text.length>5) {
            return NO;
        }
        else{
            return YES;
        }
    }else{
        return YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
