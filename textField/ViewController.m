//
//  ViewController.m
//  textField
//
//  Created by wupeng on 17/2/13.
//  Copyright (c) 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, 300, 50)];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    textField.backgroundColor =[UIColor whiteColor];
    
    textField.delegate = self;
    textField.placeholder = @"请输入密码";
    textField.secureTextEntry = YES;
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    textField.clearButtonMode = UITextFieldViewModeAlways;
    
    
    //设置return的文字
    textField.returnKeyType = UIReturnKeyDone;
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(40, 200, 300, 50)];
    
    label.backgroundColor = [UIColor greenColor];
    label.tag = 2;
    [self.view addSubview:label];
    
    
    [self.view addSubview:textField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowNotification:) name:@"UIKeyboardWillShowNotification" object:nil];
    textField.delegate = self;
    
}

- (void)willShowNotification:(NSNotification*)note {
    NSLog(@"will show notification");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //textField就是被点的return
    NSLog(@"%@", textField.text);
    NSLog(@"点击了Return键");
    
    UILabel * label = (id)[self.view viewWithTag:2];
    label.text = textField.text;
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"将开始编辑");
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"将要结束编辑");
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    NSLog(@"将要清除文字");
    //YES 清除 NO不清除
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSMutableString * mStr = [[NSMutableString alloc] initWithString:textField.text];
    
    [mStr insertString:string atIndex:range.location];
    
    return mStr.length <= 6;
}

@end
