//
//  ViewController.m
//  Demo
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 sl. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+KeyboardShowOrHide.h"

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self keyboardDidAppear];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self keyboardDidDisappear];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
}

@end
