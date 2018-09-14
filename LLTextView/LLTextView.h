//
//  LLTextView.h
//  LLTextView
//
//  Created by LianLeven on 2018/9/14.
//  Copyright © 2018年 LianLeven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLTextView : UITextView

@property (nonatomic, copy, nullable) NSString *placeHolder;
@property (nonatomic, strong) UIColor *placeHolderColor;

/**
 *  The insets to be used when the placeholder is drawn. The default value is `UIEdgeInsets(5.0, 7.0, 5.0, 7.0)`.
 */
@property (nonatomic, assign) UIEdgeInsets placeHolderInsets;

///**
// *  The object that acts as the paste delegate of the text view.
// */
//@property (weak, nonatomic, nullable) id<JSQMessagesComposerTextViewPasteDelegate> pasteDelegate;

///**
// *  Determines whether or not the text view contains text after trimming white space
// *  from the front and back of its string.
// *
// *  @return `YES` if the text view contains text, `NO` otherwise.
// */
//- (BOOL)hasText;

@end

NS_ASSUME_NONNULL_END
