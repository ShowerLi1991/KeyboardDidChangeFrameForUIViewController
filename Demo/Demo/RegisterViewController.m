//
//  RegisterViewController.m
//  AccumulationFund
//
//  Created by mac on 15/11/23.
//  Copyright © 2015年 huancun. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIViewController+KeyboardShowOrHide.h"

@interface RegisterViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCons1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCons2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCons3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWidthCons;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *gjjAccountTextField;
@property (weak, nonatomic) IBOutlet UITextField *IdentityCardTextField;
@property (weak, nonatomic) IBOutlet UITextField *cellphoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifiableCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *makeSurePasswordTextField;


@end

@implementation RegisterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat I6PStdHeight;
    if ([UIScreen mainScreen].bounds.size.width == 375) {
        I6PStdHeight = 40;
    } else if ([UIScreen mainScreen].bounds.size.width > 375) {
        I6PStdHeight = 60;
    } else if ([UIScreen mainScreen].bounds.size.width < 375) {
        I6PStdHeight = 30;
    }
    self.heightCons1.constant = I6PStdHeight;
    self.heightCons2.constant = I6PStdHeight;
    self.heightCons3.constant = I6PStdHeight * 1.5;

    self.btnWidthCons.constant = [UIScreen mainScreen].bounds.size.width * 0.75;
    self.leadingCons.constant = [UIScreen mainScreen].bounds.size.width * 0.0625;
    self.trailingCons.constant = [UIScreen mainScreen].bounds.size.width * 0.0625;
    
    self.nameTextField.delegate = self;
    self.gjjAccountTextField.delegate = self;
    self.IdentityCardTextField.delegate = self;
    self.cellphoneTextField.delegate = self;
    self.verifiableCodeTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.makeSurePasswordTextField.delegate = self;
}

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




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"text = %@", textField.text);
    NSLog(@"str = %@", string);
    if (textField.text.length > 0) {
        textField.selected = true;
        NSLog(@"true");
    } else {
        textField.selected = false;
        NSLog(@"false");
    }
    return true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag < 100006) {
        UIView * v = [self.view viewWithTag:(textField.tag + 1)];
        NSLog(@"%@", v);
        [v becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        if (self.registerButton.enabled) {
            [self.registerButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
    return true;
}



- (IBAction)gougou:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.registerButton.enabled = true;
    } else {
        self.registerButton.enabled = false;
    }
}

- (IBAction)registerButtonClick:(UIButton *)sender {
    NSLog(@"注册");
}

@end
