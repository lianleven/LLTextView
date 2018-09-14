//
//  LLTextView.m
//  LLTextView
//
//  Created by LianLeven on 2018/9/14.
//  Copyright © 2018年 LianLeven. All rights reserved.
//

#import "LLTextView.h"

@interface LLTextView()

@property (nonatomic, weak) NSLayoutConstraint *heightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *minHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *maxHeightConstraint;

@end

@implementation LLTextView

// MARK: - life
#pragma mark - Initialization

- (void) configureTextView
{
//    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
//    
//    CGFloat cornerRadius = 6.0f;
//
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textContainerInset = UIEdgeInsetsMake(4.0f, 2.0f, 4.0f, 2.0f);
    self.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.contentMode = UIViewContentModeRedraw;
//    
    self.text = nil;
    _placeHolder = nil;
    _placeHolderColor = [UIColor lightGrayColor];
    _placeHolderInsets = UIEdgeInsetsMake(5.0, 7.0, 5.0, 7.0);
//
//    [self associateConstraints];
    
    [self  addTextViewNotificationObservers];
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        [self  configureTextView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self  configureTextView];
}

- (void)dealloc
{
    [self  removeTextViewNotificationObservers];
}

// TODO: we should just set these from the xib
- (void)associateConstraints
{
    // iterate through all text view's constraints and identify
    // height, max height and min height constraints.
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            
            if (constraint.relation == NSLayoutRelationEqual) {
                self.heightConstraint = constraint;
            }
            
            else if (constraint.relation == NSLayoutRelationLessThanOrEqual) {
                self.maxHeightConstraint = constraint;
            }
            
            else if (constraint.relation == NSLayoutRelationGreaterThanOrEqual) {
                self.minHeightConstraint = constraint;
            }
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize sizeThatFits = [self sizeThatFits:self.frame.size];
    float newHeight = sizeThatFits.height;
    if (self.maxHeightConstraint) {
        newHeight = MIN(newHeight, self.maxHeightConstraint.constant);
    }
    if (self.minHeightConstraint) {
        newHeight = MAX(newHeight, self.minHeightConstraint.constant);
    }
    self.heightConstraint.constant = newHeight;
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
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    [self setNeedsDisplay];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    [self setNeedsDisplay];
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
