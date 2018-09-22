//
//  UIView+layout.m
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import "UIView+layout.h"

@implementation UIView (layout)

#pragma mark - layout height
- (NSLayoutConstraint *)layout_height:(CGFloat)height
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:height];
    [superview addConstraint:constraint];
    return constraint;
}
- (NSLayoutConstraint *)layout_heightEqualToView:(UIView *)view
{
    NSLayoutConstraint *constraint = [self layout_height:0 equalToView:view relation:NSLayoutRelationEqual];
    return constraint;
}
- (NSLayoutConstraint *)layout_height:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeHeight relation:relation toView:view toAttribute:NSLayoutAttributeHeight multiplier:1.0];
    return constraint;
}
#pragma mark - layout width
- (NSLayoutConstraint *)layout_width:(CGFloat)width
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:width];
    [superview addConstraint:constraint];
    return constraint;
}
- (NSLayoutConstraint *)layout_widthEqualToView:(UIView *)view
{
    NSLayoutConstraint *constraint = [self layout_width:0 equalToView:view relation:NSLayoutRelationEqual];
    return constraint;
}
- (NSLayoutConstraint *)layout_width:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeWidth relation:relation toView:view toAttribute:NSLayoutAttributeWidth multiplier:1.0];
    return constraint;
}
#pragma mark - size
- (void)layout_size:(CGSize)size
{
    [self layout_height:size.height];
    [self layout_width:size.width];
}
- (void)layout_sizeEqualToView:(UIView *)view
{
    [self layout_heightEqualToView:view];
    [self layout_widthEqualToView:view];
}

#pragma mark - layout center
- (void)layout_centerEqualToView:(UIView *)view{
    [self layout_centerXEqualToView:view];
    [self layout_centerYEqualToView:view];
}
- (NSLayoutConstraint *)layout_centerXEqualToView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)layout_centerYEqualToView:(UIView *)view
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    [superview addConstraint:constraint];
    return constraint;
}

#pragma mark - layout align
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toView:(UIView *)view
{
    NSLayoutConstraint *constraint = [self layout_top:constant toView:view toAttribute:NSLayoutAttributeTop];
    return constraint;
}
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_top:constant relation:NSLayoutRelationEqual toView:view toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_top:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeTop relation:relation toView:view toAttribute:toAttribute multiplier:1.0];
    return constraint;
}

- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toView:(UIView *)view
{
    NSLayoutConstraint *constraint = [self layout_bottom:constant toView:view toAttribute:NSLayoutAttributeBottom];
    return constraint;
}

- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_bottom:constant relation:NSLayoutRelationEqual toView:view toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeBottom relation:relation toView:view toAttribute:toAttribute multiplier:1.0];
    return constraint;
}

- (NSLayoutConstraint *)layout_left:(CGFloat)constant toView:(UIView *)view
{
    NSLayoutConstraint *constraint = [self layout_left:constant toView:view toAttribute:NSLayoutAttributeLeft];
    return constraint;
}

- (NSLayoutConstraint *)layout_left:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_left:constant relation:NSLayoutRelationEqual toView:view toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_left:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeLeft relation:relation toView:view toAttribute:toAttribute multiplier:1.0];
    return constraint;
}

- (NSLayoutConstraint *)layout_right:(CGFloat)constant toView:(UIView *)view
{
    NSLayoutConstraint *constraint = [self layout_right:constant toView:view toAttribute:NSLayoutAttributeRight];
    return constraint;
}

- (NSLayoutConstraint *)layout_right:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_right:constant relation:NSLayoutRelationEqual toView:view toAttribute:toAttribute];
    return constraint;
}

- (NSLayoutConstraint *)layout_right:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute
{
    NSLayoutConstraint *constraint = [self layout_constant:constant attribute:NSLayoutAttributeRight relation:relation toView:view toAttribute:toAttribute multiplier:1.0];
    return constraint;
}

- (NSLayoutConstraint *)layout_constant:(CGFloat)constant
                              attribute:(NSLayoutAttribute)attribute
                               relation:(NSLayoutRelation)relation
                                 toView:(UIView *)view
                            toAttribute:(NSLayoutAttribute)toAttribute
                             multiplier:(CGFloat)multiplier
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:view attribute:toAttribute multiplier:multiplier constant:constant];
    [superview addConstraint:constraint];
    return constraint;
}


- (void)layout_edgeInsets:(UIEdgeInsets)edgeInsets{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_left:edgeInsets.left toView:superview];
    [self layout_right:edgeInsets.right toView:superview];
    [self layout_top:edgeInsets.top toView:superview];
    [self layout_bottom:edgeInsets.bottom toView:superview];
}

- (void)layout_fillWidth
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_left:0 toView:superview];
    [self layout_right:0 toView:superview];
}

- (void)layout_fillHeight
{
    UIView *superview = self.superview;
    NSAssert(superview != nil, @"superview is nil");
    [self layout_top:0 toView:superview];
    [self layout_bottom:0 toView:superview];
}

- (void)layout_fill
{
    [self layout_fillWidth];
    [self layout_fillHeight];
}

@end
