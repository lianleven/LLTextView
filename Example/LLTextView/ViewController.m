//
//  ViewController.m
//  LLTextView
//
//  Created by LianLeven on 2018/9/14.
//  Copyright © 2018年 LianLeven. All rights reserved.
//

#import "ViewController.h"
#import "LLTextView.h"
#import "UIView+layout.h"

@interface ViewController ()<UITextViewDelegate>

@property (nonatomic, strong) LLTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textView];
//    [self.textView layout_width:300];
    [self.textView layout_height:100];
    [self.textView layout_left:12 toView:self.view];
    [self.textView layout_right:-12 toView:self.view];
    [self.textView layout_top:80 toView:self.view];
    
    self.textView.didChangeBlock = ^(LLTextView * _Nonnull textView, NSUInteger remainderLength) {
        NSLog(@"还能输入 %@ 字符长度",@(remainderLength));
    };
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.textView resignFirstResponder];
}
#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(LLTextView *)textView{
    
}

#pragma mark - Getter

- (LLTextView *)textView{
    if (!_textView) {
        LLTextView *textView = [LLTextView new];
        textView.placeHolder = @"请输入字符串";
        textView.placeHolderColor = [UIColor darkGrayColor];
        textView.font = [UIFont systemFontOfSize:14];
        textView.layer.borderWidth = 0.3f;
        textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textView.layer.cornerRadius = 4.0f;
        textView.delegate = self;
        textView.maxStringLength = 10000;
        _textView = textView;
    }
    return _textView;
}

@end
