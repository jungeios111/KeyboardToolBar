//
//  ViewController.m
//  键盘处理-自定义工具条
//
//  Created by ZKJ on 2017/3/1.
//  Copyright © 2017年 ZKJ. All rights reserved.
//

#import "ViewController.h"
#import "ZKJKeyboardToolBar.h"

@interface ViewController ()<ZKJKeyboardToolBarDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UITextField *emailTF;
@property (strong, nonatomic) IBOutlet UITextField *addressTF;
/** 文本框数组 */
@property(nonatomic,strong) NSArray *fields;
/** 工具条 */
@property(nonatomic,strong) ZKJKeyboardToolBar *toolBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fields = @[self.nameTF, self.emailTF, self.addressTF];
    ZKJKeyboardToolBar *toolBar = [ZKJKeyboardToolBar toolBar];
    toolBar.toolBarDelegate = self;
    self.toolBar = toolBar;
    
    self.nameTF.inputAccessoryView = toolBar;
    self.emailTF.inputAccessoryView = toolBar;
    self.addressTF.inputAccessoryView = toolBar;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - <ZKJKeyboardToolBarDelegate>
- (void)keyboardToolBar:(ZKJKeyboardToolBar *)toolBar didClickItem:(ZKJKeyboardToolBarItem)item
{
    if (item == ZKJKeyboardToolBarPreviousItem) {
        NSInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex--;
        [self.fields[currentIndex] becomeFirstResponder];
        self.toolBar.previousItem.enabled = (currentIndex != 0);
        self.toolBar.nextItem.enabled = YES;
    } else if (item == ZKJKeyboardToolBarNextItem) {
        NSInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex++;
        [self.fields[currentIndex] becomeFirstResponder];
        self.toolBar.previousItem.enabled = YES;
        self.toolBar.nextItem.enabled = (currentIndex != self.fields.count - 1);
    } else if (item == ZKJKeyboardToolBarDoneItem) {
        [self.view endEditing:YES];
    }
}

#pragma mark - <UITextFieldDelegate>
/**
 * 当点击键盘右下角的return key时,就会调用这个方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameTF) {
        [self.emailTF becomeFirstResponder];
    } else if (textField == self.emailTF) {
        [self.addressTF becomeFirstResponder];
    } else if (textField == self.addressTF) {
        [self.view endEditing:YES];
    }
    return YES;
}

/**
 * 键盘弹出就会调用这个方法
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSInteger currentIndex = [self.fields indexOfObject:textField];
    self.toolBar.previousItem.enabled = (currentIndex != 0);
    self.toolBar.nextItem.enabled = (currentIndex != self.fields.count - 1);
}


@end
