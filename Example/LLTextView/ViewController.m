//
//  ViewController.m
//  LLTextView
//
//  Created by LianLeven on 2018/9/14.
//  Copyright © 2018年 LianLeven. All rights reserved.
//

#import "ViewController.h"
#import "LLTextView.h"

@interface ViewController ()

@property (nonatomic, strong) LLTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.frame = CGRectMake(12, 64, CGRectGetWidth(self.view.frame) - 24, 200);
    [self.view addSubview:self.textView];
//    self.textView
}

#pragma mark - Getter

- (LLTextView *)textView{
    if (!_textView) {
        LLTextView *textView = [LLTextView new];
        textView.placeHolder = @"请输入字符串";
        textView.placeHolderColor = [UIColor lightGrayColor];
        _textView = textView;
    }
    return _textView;
}

@end
