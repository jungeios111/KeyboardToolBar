//
//  ZKJKeyboardToolBar.h
//  键盘处理-自定义工具条
//
//  Created by ZKJ on 2017/3/1.
//  Copyright © 2017年 ZKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZKJKeyboardToolBarPreviousItem,
    ZKJKeyboardToolBarNextItem,
    ZKJKeyboardToolBarDoneItem,
} ZKJKeyboardToolBarItem;

@class ZKJKeyboardToolBar;
@protocol ZKJKeyboardToolBarDelegate <NSObject>

@optional
- (void)keyboardToolBar:(ZKJKeyboardToolBar *)toolBar didClickItem:(ZKJKeyboardToolBarItem)item;

@end

@interface ZKJKeyboardToolBar : UIToolbar

@property (strong, nonatomic, readwrite) IBOutlet UIBarButtonItem *previousItem;
@property (strong, nonatomic, readwrite) IBOutlet UIBarButtonItem *nextItem;
/** 代理 */
@property(nonatomic,weak) id<ZKJKeyboardToolBarDelegate>toolBarDelegate;

+ (instancetype)toolBar;

@end
