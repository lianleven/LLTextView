//
//  LLTextView.h
//  LLTextView
//
//  Created by LianLeven on 2018/9/14.
//  Copyright © 2018年 LianLeven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LLTextViewMaxLengthType){
    LLTextViewMaxLengthTypeCustom = 0,
    LLTextViewMaxLengthTypeDefault = 1,
};

@class LLTextView;

typedef void(^LLTextViewDidChangeBlock)(LLTextView *textView, NSUInteger remainderLength);

IB_DESIGNABLE
@interface LLTextView : UITextView

@property (nonatomic, copy, nullable) IBInspectable NSString *placeHolder;
@property (nonatomic, strong) IBInspectable UIColor *placeHolderColor;

@property (nonatomic, assign) IBInspectable NSUInteger maxStringLength;

// border configure
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@property (nonatomic, copy) LLTextViewDidChangeBlock didChangeBlock;

/**
 *  The default value is `UIEdgeInsets(5.0, 7.0, 5.0, 7.0)`.
 */
@property (nonatomic, assign) UIEdgeInsets placeHolderInsets;

@end

NS_ASSUME_NONNULL_END
