//
//  UIView+layout.h
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIView (layout)

// height
- (NSLayoutConstraint *)layout_height:(CGFloat)height;
- (NSLayoutConstraint *)layout_heightEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_height:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation;

// width
- (NSLayoutConstraint *)layout_width:(CGFloat)width;
- (NSLayoutConstraint *)layout_widthEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_width:(CGFloat)constant equalToView:(UIView *)view relation:(NSLayoutRelation)relation;

// size
- (void)layout_size:(CGSize)size;
- (void)layout_sizeEqualToView:(UIView *)view;

// center
- (void)layout_centerEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_centerXEqualToView:(UIView *)view;
- (NSLayoutConstraint *)layout_centerYEqualToView:(UIView *)view;

//
#pragma mark - top, bottom, left, right
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)layout_top:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_top:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_bottom:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_left:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)layout_left:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_left:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_right:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)layout_right:(CGFloat)constant toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;
- (NSLayoutConstraint *)layout_right:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view toAttribute:(NSLayoutAttribute)toAttribute;

- (NSLayoutConstraint *)layout_constant:(CGFloat)constant
                              attribute:(NSLayoutAttribute)attribute
                               relation:(NSLayoutRelation)relation
                                 toView:(UIView *)view
                            toAttribute:(NSLayoutAttribute)toAttribute
                             multiplier:(CGFloat)multiplier;

// UIEdgeInsets
- (void)layout_edgeInsets:(UIEdgeInsets)edgeInsets;

- (void)layout_fillWidth;
- (void)layout_fillHeight;
- (void)layout_fill;

@end
NS_ASSUME_NONNULL_END
