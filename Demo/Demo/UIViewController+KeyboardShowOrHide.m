//
//  UIViewController+KeyboardShowOrHide.m
//  AccumulationFund
//
//  Created by mac on 15/11/24.
//  Copyright © 2015年 huancun. All rights reserved.
//

#import "UIViewController+KeyboardShowOrHide.h"

@implementation UIViewController (KeyboardShowOrHide)

- (void)keyboardDidAppear {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardDidDisappear {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    // 可以修改拇指距离
    static CGFloat const thumbHeight = 64;
    
    for (UIView *firstResponderView in self.view.subviews) {
        if ([firstResponderView isFirstResponder]) {
            CGFloat y = firstResponderView.frame.size.height + firstResponderView.frame.origin.y;
            CGRect keyboardBeginFrame = [notification.userInfo[@"UIKeyboardFrameBeginUserInfoKey"] CGRectValue];
            CGRect keyboardEndFrame = [notification.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
            NSTimeInterval keyboardAnimation = [notification.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
            
            static CGFloat rollHeight;
            
            CGFloat height = y + thumbHeight + keyboardEndFrame.size.height - [UIScreen mainScreen].bounds.size.height + rollHeight;
            
            if (y + keyboardEndFrame.size.height + thumbHeight > [UIScreen mainScreen].bounds.size.height && (int)self.view.frame.origin.y <= 0) {
                int x = keyboardBeginFrame.size.height - keyboardEndFrame.size.height;
                if (x * x == 29 * 29) {
                    [UIView animateWithDuration:0.1 delay:0 options:0 animations:^{
                        CGFloat newHeight = 29 * (keyboardBeginFrame.origin.y >= keyboardEndFrame.origin.y ? -1 : 1);
                        self.view.frame = CGRectOffset(self.view.frame, 0, newHeight);
                        rollHeight += newHeight;
                    } completion:nil];
                } else {
                    [UIView animateWithDuration:keyboardAnimation delay:0 options:0 animations:^{
                        CGFloat newHeight = (keyboardBeginFrame.origin.y >= keyboardEndFrame.origin.y ? -height : -rollHeight);
                        self.view.frame = CGRectOffset(self.view.frame, 0, newHeight);
                        rollHeight += newHeight;
                    } completion:nil];
                }
            } else {
                [UIView animateWithDuration:keyboardAnimation delay:0 options:0 animations:^{
                    self.view.frame = CGRectOffset(self.view.frame, 0, -rollHeight);
                    rollHeight = 0;
                } completion:nil];
            }
        }
    }
}


@end
