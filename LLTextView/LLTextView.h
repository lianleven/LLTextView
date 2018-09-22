//
//  LLTextView.h
//  LLTextView
//
//  Created by LianLeven on 2018/9/14.
//  Copyright © 2018年 LianLeven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LLTextView;

typedef void(^LLTextViewDidChangeBlock)(LLTextView *textView, NSUInteger remainderLength);

@interface LLTextView : UITextView

@property (nonatomic, copy, nullable) NSString *placeHolder;
@property (nonatomic, strong) UIColor *placeHolderColor;

@property (nonatomic, assign) NSUInteger maxStringLength;
@property (nonatomic, copy) LLTextViewDidChangeBlock didChangeBlock;

/**
 *  The default value is `UIEdgeInsets(5.0, 7.0, 5.0, 7.0)`.
 */
@property (nonatomic, assign) UIEdgeInsets placeHolderInsets;

@end

NS_ASSUME_NONNULL_END
