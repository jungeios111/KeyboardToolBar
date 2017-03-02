//
//  ZKJKeyboardToolBar.m
//  键盘处理-自定义工具条
//
//  Created by ZKJ on 2017/3/1.
//  Copyright © 2017年 ZKJ. All rights reserved.
//

#import "ZKJKeyboardToolBar.h"

@implementation ZKJKeyboardToolBar

+ (instancetype)toolBar
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (IBAction)previousClick:(id)sender
{
    if ([self.toolBarDelegate respondsToSelector:@selector(keyboardToolBar:didClickItem:)]) {
        [self.toolBarDelegate keyboardToolBar:self didClickItem:ZKJKeyboardToolBarPreviousItem];
    }
}

- (IBAction)nextClick:(id)sender
{
    if ([self.toolBarDelegate respondsToSelector:@selector(keyboardToolBar:didClickItem:)]) {
        [self.toolBarDelegate keyboardToolBar:self didClickItem:ZKJKeyboardToolBarNextItem];
    }
}
- (IBAction)doneClick:(id)sender
{
    if ([self.toolBarDelegate respondsToSelector:@selector(keyboardToolBar:didClickItem:)]) {
        [self.toolBarDelegate keyboardToolBar:self didClickItem:ZKJKeyboardToolBarDoneItem];
    }
}


@end
