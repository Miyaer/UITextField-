//
//  NextViewController.h
//  UITextField限制个数
//
//  Created by miya on 16/8/9.
//  Copyright © 2016年 miya. All rights reserved.
//

#import "ViewController.h"
typedef void(^myBlock)(NSString * str);
@interface NextViewController : UIViewController
@property (nonatomic,strong) myBlock myBlock;
@end
