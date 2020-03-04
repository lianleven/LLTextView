//
//  LLTextView.m
//  LLTextView
//
//  Created by LianLeven on 2018/9/14.
//  Copyright © 2018年 LianLeven. All rights reserved.
//

#import "LLTextView.h"

@interface LLTextView()

@end

@implementation LLTextView

// MARK: - life
#pragma mark - Initialization

- (void) configureTextView
{
    
    self.textContainerInset = UIEdgeInsetsMake(4.0f, 2.0f, 4.0f, 2.0f);
    self.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
    self.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.contentMode = UIViewContentModeRedraw;
   
    self.text = nil;
    _placeHolder = nil;
    _placeHolderColor = [UIColor lightGrayColor];
    _placeHolderInsets = UIEdgeInsetsMake(5.0, 7.0, 5.0, 7.0);
    
    [self addTextViewNotificationObservers];
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        [self  configureTextView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self  configureTextView];
    }
    return self;
}

- (void)dealloc
{
    [self  removeTextViewNotificationObservers];
}

#pragma mark - Setters

- (void)setPlaceHolder:(NSString *)placeHolder
{
    if ([placeHolder isEqualToString:_placeHolder]) {
        return;
    }
    
    _placeHolder = [placeHolder copy];
    [self setNeedsDisplay];
}

- (void)setplaceHolderColor:(UIColor *) placeHolderColor
{
    if ([placeHolderColor isEqual:_placeHolderColor]) {
        return;
    }
    
    _placeHolderColor =  placeHolderColor;
    [self setNeedsDisplay];
}

- (void)setPlaceHolderInsets:(UIEdgeInsets)placeHolderInsets
{
    if (UIEdgeInsetsEqualToEdgeInsets(placeHolderInsets, _placeHolderInsets)) {
        return;
    }
    
    _placeHolderInsets = placeHolderInsets;
    [self setNeedsDisplay];
}

#pragma mark - UITextView overrides


- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    
    if (self.contentSize.height <= self.bounds.size.height + 1){
        self.contentOffset = CGPointZero;
    }
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    if ([text length] == 0) {
        [self setNeedsDisplay];
    }
    
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    if ([self.text length] == 0) {
        [self setNeedsDisplay];
    }
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    if ([self.text length] == 0) {
        [self setNeedsDisplay];
    }
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    if ([self.text length] == 0) {
        [self setNeedsDisplay];
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
    
    self.layer.cornerRadius = 4.0f;
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}
- (void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if ([self.text length] == 0 && self.placeHolder) {
        [self. placeHolderColor set];
        
        [self.placeHolder drawInRect:UIEdgeInsetsInsetRect(rect, self.placeHolderInsets)
                      withAttributes:[self placeholderTextAttributes]];
    }
}

#pragma mark - Notifications

- (void)addTextViewNotificationObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTextViewNotification:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTextViewNotification:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTextViewNotification:)
                                                 name:UITextViewTextDidEndEditingNotification
                                               object:self];
}

- (void)removeTextViewNotificationObservers
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidBeginEditingNotification
                                                  object:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidEndEditingNotification
                                                  object:self];
}

- (void) didReceiveTextViewNotification:(NSNotification *)notification
{
    [self setNeedsDisplay];
    // limit count
    if ([notification.name isEqualToString:UITextViewTextDidChangeNotification]) {
        UITextView *textView = notification.object;
        if (!textView || ![textView isKindOfClass:[UITextView class]]) return;
        UITextRange *markedTextRange = textView.markedTextRange;
        if ([textView positionFromPosition:markedTextRange.start offset:0] != nil) {
            return;
        }
        if (self.maxStringLength == 0) return;
        if ([textView.text length] > self.maxStringLength) {
            textView.text = [textView.text substringToIndex:self.maxStringLength];
        }
        if (self.didChangeBlock) {
            self.didChangeBlock(self, self.maxStringLength - [textView.text length]);
        }
    }
}

#pragma mark - Utilities

- (NSDictionary *)placeholderTextAttributes
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = self.textAlignment;
    
    return @{ NSFontAttributeName : self.font,
              NSForegroundColorAttributeName : self.placeHolderColor,
              NSParagraphStyleAttributeName : paragraphStyle };
}


@end
